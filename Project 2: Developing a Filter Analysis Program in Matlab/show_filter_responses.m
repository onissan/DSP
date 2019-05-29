function [poles,zeros,HF,Fd,hn,n] = show_filter_responses(Ak,Bk,fsample,...
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
title('"Pole/Zero? diagram')
xlabel('Real Axis')
ylabel('Imaginery Axis')
 
[HF, W] = freqz(Bk, Ak, num_of_f_points); %second and third figures use previously written function to plot frequency responses: one against digital frequency and one with H(F) in dB against analog frequency
 
Fd = W/(2*pi); %generate the digital frequencies
 
plot_freq_responses(Fd, HF, fsample, (figure_num+1)); %Plot analog and digital bode plots for filter
 
[dn, n] = unit_sample(num_of_n_points+1); %generate unit sample sequence
 
hn = filter(Bk,Ak,dn); %generate unit sample response
 
figure(figure_num+3) %fourth figure uses previously written function to plot the unit sample response 
stem(n,hn)
grid on
title('A Unit Sample Response')
ylabel('Unit Sample Sequence Value')
xlabel('Sample Index Value')
 
[ three_dB_bandwidth_analog , cutoff_freq , filter_type ....
    peak_mag ,peak_mag_freq , min_mag , min_mag_freq , ...
    Max_attenuation , magnitude_of_three_dB] = filter_analysis(HF , fsample) %run filter analysis
 
end
