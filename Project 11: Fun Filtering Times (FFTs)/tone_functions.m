%Commands needed to run functions to produce the test case results 
 
%Command for test case settings
%Equalizer([12 -6 -12 -12 -6 12 -6 12 -6],707,Zarathustra.wav');
%Command for selected settings
%Equalizer([6 5 3 0 -1 1 3 4 7],707,Zarathustra.wav');

%Command for test case settings
% echo_equalizer_filter([12 -6 -12 -12 -6 12 -6 12 -6],707,Zarathustra.wav',[250 400 520 660 750 1220 ],[ 0.7 0.6 0.5 0.33 0.2 0.8 ],44.1E3)
%Command for selected settings
%echo_equalizer_filter([6 5 3 0 -1 1 3 4 7],707,Zarathustra.wav',[100 250 550 700 800 1100 ],[ 0.9 0.45 0.25 0.125 0.07 0.05 ],44.1E3);
 
function [equalizer_filter_hn] = Equalizer( dB_array , M , input_filename)
%function [equalizer_filter_hn] = Equalizer( dB_array , M ,
%input_filename);
 
%Input parameters are:
%   dB_array = list of the desired dB magnitude values corresponding to the
%   target center frequencies
%   M = desired length of Equalizer filter
%   input_filename = file to be processed by filter
 
%Output values returned are:
%   equalizer_filter_hn = normalized filter output of the designed Equalizer 
% Developed by: Zoe Hay and Omri Nissan
% Revised: 3/20/18
 
%Initalize Constants and Frequency Index
index = linspace(0,M-1,M)%generate 0 index to plot against 
center_freq_analog  = [62.5 , 125 , 250 , 500 , 1E3, 2E3, 4E3, 8E3, 16E3]%target center frequencies
fsample = 44.1E3 %standard audio sample rate
center_freq_analog = center_freq_analog./fsample
k_for_center_freq = round(M.*center_freq_analog)%index for center frequencies
k_value_mag = zeros([1,(M-1)/2 + 1]);%initalize array for magnitude values
k_value_mag(1) = 0;
 
%Generate Magnitude Response Values
for i=1:1:length(k_for_center_freq)%assign given dB values at center frequenices
    k_value_mag(k_for_center_freq(i)+1) = dB_array(i);
end
 
%fill in between given center frequency dB values using linear connections
k_for_center_freq = [k_for_center_freq , ((M-1)/2 + 1)]
k_for_center_freq = k_for_center_freq+1;
dB_array = [dB_array , 0];
for i=1:1: (length(k_for_center_freq)-1)
    width = k_for_center_freq(i+1)-k_for_center_freq(i);
 
    slope = ((dB_array(i+1))-(dB_array(i)))/width;
    boost = dB_array(i);
    k_value_mag(k_for_center_freq(i)) = boost;
    for x=(k_for_center_freq(i)+1):1:(k_for_center_freq(i+1)-1)
        boost = boost + slope;    
        k_value_mag(x)= boost;
    end
    
end 
 
%the second half of the magnitudes are even symmetric with the first
%flip and append the already calculated magnitudes to find the remainder
flip_k_value_mag = flip(k_value_mag)
k_value_mag = [ k_value_mag , flip_k_value_mag]
k_value_mag(length(k_value_mag))=[] %remove redundant final value
k_value_mag=db2mag(k_value_mag);%convert dB values to linear
 
%Generate Phase Values
for i=1:1:(M)
    k_value_phase(i) = -pi()*((i-1)*(M-1))/M;%phase has odd symmetry
end 
 
%Calculate Complex Frequency Response Values HdF and Apply Window
HdF = k_value_mag.*exp(j.*k_value_phase);%combine magnitude and phase
hd = real(ifft(HdF))%determine impulse response using inverse DFT
w = tukeywin(M); %choose tukey window
h_equ = hd .* w.'; %mutiply h by window
 
%Plot the Filter Design
Ak=zeros(1,707);%generate Ak coefficients
Ak(1)=1;
Bk=h_equ;%Bk coefficents are the windowed impulse response 
show_filter_responses(Ak,Bk,fsample,fsample*3,M,1);
 
%Read and Process the Input
[y,Fs] = audioread(input_filename);
channel_1 = filter(Bk,Ak,y(:,1));
 
[m,n]=size(y);%determine if 1 channel or 2
if(n==2)
    channel_2 = filter(Bk,Ak,y(:,2));
    filtered_output = [channel_1 , channel_2];
else
    filtered_output = channel_1;    
end
 
max_value = max(filtered_output); %find gain of each channel
Gain = max(max_value'); %find the highest gain from both channels
% [ DFTx, Fd ]=plot_DFT_mag(y/Gain,fsample,6);
% [ DFTx, Fd ]=plot_DFT_mag(filtered_output/Gain,fsample,7);
 
equalizer_filter_hn = filtered_output/Gain; %normalize the equalizer impulse response based on highest gain
out_filename = strcat('out_',input_filename); %re-name the output wav 
audiowrite(out_filename,equalizer_filter_hn,Fs); %generate output wav file
[newy,newFs] = audioread(out_filename);
soundsc(newy,newFs);
end
 
 
function  [echo_filter_hn]= echo_filter(Dk_delays_msec,alphak_gains,Fsample);
%function  [echo_filter_hn]= echo_filter(Dk_delays_msec,alphak_gains,Fsample);
 
%Input parameters are:
%   Dk_delay_msec = echo delay time in msec
%   alphak_gains = fractional gain in amplitude of echo compared with original
%   Fsample = sampling frequency
 
%Output values returned are:
%   echo_filter_hn = impulse response of echo filter
 
% Developed by: Zoe Hay and Omri Nissan
% Revised: 3/20/18
 
    Tsample = (1/Fsample); %translate samples into time to compare with the delay 
    Dk_delays = round((Dk_delays_msec*10^-3)/Tsample); %translate delay value into specific number of sample delay
        
    echo_filter_hn=zeros(1,max(Dk_delays)); %generate delayed delta functions of the filter
    echo_filter_hn(1) = 1; %get the direct echo by setting first sample to magnitude of 1
    
    for i=1:1:length(Dk_delays_msec)
        echo_filter_hn(Dk_delays(i))=alphak_gains(i); %assign each sample delay magnitude to respective gain value
    end 
    
    figure(15)
    stem(echo_filter_hn); %graph the echo filter impulse response
    
end

function [ output_hn ] = echo_equalizer_filter( dB_array , M , input_filename ,Dk_delays_msec , alphak_gains , Fsample )
%[ output_hn ] = echo_equalizer_filter( dB_array , M , input_filename ,Dk_delays_msec , alphak_gains , Fsample )
 
%Input parameters are:
%   dB_array = list of the desired dB magnitude values corresponding to the
%   target center frequencies
%   M = desired length of Equalizer filter
%   input_filename = file to be processed by filter
%   Dk_delay_msec = echo delay time in msec
%   alphak_gains = fractional gain in amplitude of echo compared with original
%   Fsample = sampling frequency
 
%Output values returned are:
%   output_hn = impulse response of echo filter

% Developed by: Zoe Hay and Omri Nissan
% Revised: 3/20/18
 
[equalizer_filter_hn] = Equalizer( dB_array , M , input_filename); %get equalizer filter impulse response
 
[echo_filter_hn] = echo_filter(Dk_delays_msec,alphak_gains,Fsample); %get echo filter impulse response
 
output_hn_ch1 = fftconv( echo_filter_hn, (equalizer_filter_hn(:,1))' ); %get echo equalizer impulse response for channel 1
 
[m,n]=size(equalizer_filter_hn);%determine if 1 channel or 2
 
if(n==2)
    output_hn_ch2 = fftconv( echo_filter_hn, (equalizer_filter_hn(:,2))' ); %get channel 2 echo equalizer impulse response if it exists
    output_hn = [output_hn_ch1' , output_hn_ch2']; %combine channel 1 and 2 to get total hn
else
    output_hn = output_hn_ch1'; %set channel 1 as the total hn
end
 
figure(50)
plot(output_hn); %plot total hn
 
out_filename = strcat('out_with_echo_',input_filename); %re-name the output wav 
 
audiowrite(out_filename,output_hn,Fsample); %generate output wav file
[newy,newFs] = audioread(out_filename);
soundsc(newy,newFs);

 
 
end
 
function [poles,zeros,HF,Fd,hn,n,W] = show_filter_responses(Ak,Bk,fsample,...
num_of_f_points,num_of_n_points,figure_num);
% function [poles,zeros,HF,Fd,hn,n] = show_filter_responses(Ak,Bk,fsample,...
%   num_of_f_points,num_of_n_points,figure_num);
 
% Input parameters (arguments) are:
% Ak = a list of the Ak coefficients of the filter difference equation (coefficients of the ?y? terms)
% Bk = a list of the Bk coefficients of the filter difference equation (coefficients of the ?x? terms)
% fsample = sampling frequency (samples / second)
% num_of_f_points = the # of points for the freq. response plot
% num_of_n_points = the # of points for the unit sample response plot
% figure_num = number of the 1st figure to use for plots
 
% Output values returned are:
%   poles = a list of the Z plane locations (complex values) for all the POLES of the filter (a row vector)
%   zeros = a list of the Z plane locations (complex values) for all the ZEROS of the filter (a row vector)
%   HF = the DTFT frequency response values (linear scale)
%   Fd = digital frequencies that match the freq response values
%   hn = has the unit sample response sequence values
%   n = has the corresponding sample indices (0 to [num_of_n_points ? 1]);
 
% Developed by: Zoe Hay and Omri Nissan
% Revised: 1/19/18
 
poles = roots(Ak); %find poles and zeros from given Ak and Bk terms
zeros = roots(Bk);
 
figure(figure_num); %first figure shows pole/zero diagram
zplane(Bk, Ak);
grid on
title('"Pole/Zero" diagram')
xlabel('Real Axis')
ylabel('Imaginery Axis')
 
[HF, W] = freqz(Bk, Ak, num_of_f_points); %second and third figures use previously written function to plot frequency responses: one against digital frequency and one with H(F) in dB against analog frequency
 
Fd = W/(2*pi); %generate the digital frequencies
 
plot_freq_responses(Fd, HF, fsample, (figure_num+1)); %Plot analog and digital bode plots for filter
 
[dn, n] = unit_sample(num_of_n_points); %generate unit sample sequence
 
hn = filter(Bk,Ak,dn); %generate unit sample response
 
figure(figure_num+3) %fourth figure uses previously written function to plot the unit sample response 
stem(n,hn)
grid on
title('A Unit Sample Response')
ylabel('Unit Sample Sequence Value')
xlabel('Sample Index Value')
 
[ three_dB_bandwidth_analog , cutoff_freq , filter_type ....
    peak_mag ,peak_mag_freq , min_mag , min_mag_freq , ...
    Max_attenuation , magnitude_of_three_dB] = filter_analysis(HF , fsample); %run filter analysis
 
end

function  yn = fftconv( xn, hn )
% function  yn = fftconv( xn, hn) ;
%
% Input parameters (arguments) are:
% xn = input time sequence
% hn = filter time sequence
%
% Output values returned are:
%   yn = output time sequence
%
% Developed by: Zoe Hay and Omri Nissan
% Revised: 1/23/17
 
% Determine length of original sequences
Mx = length(xn);
Mh = length(hn);
 
% Set Convolution Length to match the of the linear convolution
M = Mx+Mh-1;
 
% Optimize the number of padding for faster processing using length divisible
%by 2)
Mfft = 2.^nextpow2(M);
 
% Zero pad each sequence to the proper length, and find the FFT of each
Xk = fft(xn, Mfft);
Hk = fft(hn, Mfft);
 
% Perform the convolution by spectral multiplication
Yk = Xk.*Hk;
 
%Inverse transform result back to time domain
y = real(ifft(Yk));
 
yn = y(1:Mx+Mh-1);
 
end
