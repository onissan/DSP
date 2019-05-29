function [ three_dB_bandwidth_analog , cutoff_freq , filter_type ....
    peak_mag ,peak_mag_freq , min_mag , min_mag_freq , ...
    Max_attenuation , magnitude_of_three_dB] = filter_analysis( HF , fsample )
% function [ three_dB_bandwidth_analog , cutoff_freq , filter_type ....
% 	peak_mag ,peak_mag_freq , min_mag , min_mag_freq , ...
% 	Max_attenuation , magnitude_of_three_dB] = filter_analysis( HF , fsample )
 
% Input parameters (arguments) are:
% HF = the complex DTFT frequency response values (linear scale)
% fsample = sampling frequency (samples / second)
 
% Output values returned are:
%   three_dB_bandwidth_analog = 3dB bandwidth of the filter
%   cutoff_freq = digital frequencies where the magnitude response
%             	crosses through the level that is 3 dB below the
%             	peak magnitude response value.
%   filter_type = i.e., low-pass, high-pass, band-pass or band-stop (notch) filter.
%   peak_mag = peak magnitude response value
%   peak_mag_freq = digital frequency at which peak magnitude response value
%   min_mag = minimum magnitude response value
%   min_mag_freq = digital frequency at which minimum magnitude response value
%   Max_attenuation = maximum attenuation of the filter (dB difference between max and min responses)
%   magnitude_of_three_dB = magnitude response at the 3 dB cutoff
%                       	frequency (linear magnitude value that is 3 dB
%                       	below the peak magnitude value).
 
 
% Developed by: Zoe Hay and Omri Nissan
% Revised: 1/19/18
 
% NOTE: Sampling start at frequency equal to zero and it doesn't go all the way to 0.5
% but to 0.499 instead. That is why one is subtracted from each results because otherwise
% it would be 0.001-0.500 and not 0-0.499
 
peak_mag = (max(abs(HF))); %find peak value of HF
peak_mag_freq = ((find(abs(HF)==peak_mag))-1)/fsample; %extract the frequency at which it occurs
 
min_mag = (min(abs(HF))); %find min value of HF
min_mag_freq = ((find(abs(HF)==min_mag))-1)/fsample; %extract the frequency at which it occurs
 
Max_attenuation = 20*log10(peak_mag-min_mag); %difference between dB values of max and min give out attenuation
 
three_dB_value = 20*log10(peak_mag) - 3; %find 3dB value by taking dB peak value and subtracting 3
 
magnitude_of_three_dB = 10^(three_dB_value/20); %turn dB value to linear
 
indexes_for_three_dB  = (find(abs(HF)<= magnitude_of_three_dB)-1); %find analog frequencies where their magnitude is less than the 3dB value. Therefore the first and last items define the filter.
 
freq_of_three_dB = (indexes_for_three_dB)/fsample; %turn analog frequencies to digital
 
First_Value = (freq_of_three_dB(1)) %extract first frequency less than 3dB
 
Last_Value = (freq_of_three_dB(length(freq_of_three_dB))) %extract last frequency less than 3dB
 
if ((First_Value == 0) & (Last_Value == 0.499))
	
    indexes_for_three_dB  = (find(abs(HF) >= magnitude_of_three_dB)-1); %find analog frequencies where their magnitude is more than the 3dB value. Therefore the first and last items define the filter.
	
    freq_of_three_dB = (indexes_for_three_dB)/fsample; %turn analog frequencies to digital
 
    First_Value = (freq_of_three_dB(1)) %extract first frequency less than 3dB
 
    Last_Value = (freq_of_three_dB(length(freq_of_three_dB))) %extract last frequency less than 3dB 
end
 
% Identify each filter based on first or last values
if(Last_Value == 0.499) % Low pass filter will always have last value equal to max frequency
    cutoff_freq = [First_Value];
    three_dB_bandwidth_digital = First_Value - 0;
    three_dB_bandwidth_analog = three_dB_bandwidth_digital*fsample;
    filter_type = 'Low Pass';
	
elseif (First_Value == 0) % High pass filter will always have first value equal to 0
    cutoff_freq = [Last_Value];
    three_dB_bandwidth_digital = 0.5 - Last_Value - (1/fsample);
    three_dB_bandwidth_analog = three_dB_bandwidth_digital*fsample;
    filter_type = 'High Pass';
 
else %othewise it could either be bandpass or notch
    cutoff_freq = [First_Value ; Last_Value];
    three_dB_bandwidth_digital = Last_Value - First_Value;
    three_dB_bandwidth_analog = three_dB_bandwidth_digital*fsample;
	
	if( (peak_mag_freq >  cutoff_freq(1)) &  (peak_mag_freq <  cutoff_freq(2))) %if the peak is between the two cutoff frequencies it is a band-pass
        filter_type = 'band-pass';
  
	else %otherwise it is a band-stop
        filter_type = 'band-stop (notch) filter';
    	
	end
	
end
 
end
	
