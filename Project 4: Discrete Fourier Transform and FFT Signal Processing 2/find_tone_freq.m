
function [ c_freq, r_freq, mag_row_index ] = find_tone_freq(tone,fsample,figure_num)
% function [ c_freq, r_freq ] = find_tone_freq(tone,fsample,figure_num)
% Input parameters (arguments) are:
% tone = input signal to analyze 
% fsample = sampling frequency 
% figure_num = index for first figure
 
% Output values returned are:
% c_freq = high frequency corresponding to column
% r_freq = low frequency corresponding to row 
% mag_row_index = magnitude of the first, strongest tone 
% Developed by: Zoe Hay and Omri Nissan
% Revised: 1/30/18
 
%plot_DFT_mag(tone,fsample,figure_num); 
 
%evaluate fft and corresponding digital frequency
fft_tone = abs(fft(tone));
Fd = [0:(length(fft_tone)-1)]./length(fft_tone);
 
 
max(fft_tone); %find index of the strongest tone
column_index = find(fft_tone==max(fft_tone)); %find magnitude at index 
column_freq = Fd(column_index(1))*fsample; %use index to find corresponding digital frequency 
 
%and convert to analog frequency 
fft_tone(find(fft_tone==max(fft_tone)))=[];%remove first strong tone
 
max(fft_tone);%find index of next strong tone
row_index= find(fft_tone==max(fft_tone));
mag_row_index=20*log10(fft_tone(find(fft_tone==max(fft_tone))));%find magnitude at index
row_freq = Fd(row_index(1))*fsample;%use index to find corresponding digital frequency 
%and convert to analog frequency 
 
%additional computation for the case where the low frequency is a greater
%magnitude than the high frequency and is located first 
if column_freq>row_freq %ensure that the column frequency is actually the highest frequency 
    c_freq = column_freq;
    r_freq = row_freq;
else 
    c_freq = row_freq;%if the low frequency was found first because it was stronger 
    r_freq = column_freq;%assign the low frequency to r_freq 
end 
end
