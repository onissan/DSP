%Test File for Uncorrupted Tones
this script tests the find_tone_freq() and tone_decode functions using
%tone files without noise
%the specified sampling frequency is 8kHz with a +/-1.5% tolerance for
%frequency matches 
%the program will print the detected high and low frequencies and the
%decoded tone 
load touchtones.mat 
 
fsample = 8000;
figure_num = 1;
tolerance = .015;
 
[ column_freq, row_freq ] = find_tone_freq(tone_0,fsample,figure_num)
tone = tone_decode(column_freq, row_freq, tolerance)
 
DFTx = fft(tone_0);
Fd = [0:(length(tone_0)-1)]./length(tone_0);
length(tone_0);
% Open a new Figure:
figure(figure_num)
%Plot Magnitude vs. Digital Frequency
subplot(2,1,1)  % Display plots in 2 rows / 1 column; This is the 1st plot.
stem(Fd,(abs(DFTx)./length(tone_0)),'.');
grid on
title('Magnitude vs. Digital Frequency of "Tone 0"')
ylabel('DFT Spectrum Value')
xlabel('Digital Frequency F (cycles/sample)')
 
%Plot Magnitude vs. Analog Frequency
subplot(2,1,2) % Display plots in 2 rows / 1 column; This is the 2nd plot.
stem(Fd.*fsample,(abs(DFTx)./length(tone_0)),'.');
grid on
title('Magnitude vs. Analog Frequency of "Tone 0"')
ylabel('DFT Spectrum Value')
xlabel('Analog Frequency F (cycles/second)')
 
 
[ column_freq, row_freq ] = find_tone_freq(tone_1,fsample,figure_num+1)
tone = tone_decode(column_freq, row_freq, tolerance)
 
[ column_freq, row_freq ] = find_tone_freq(tone_2,fsample,figure_num+2)
tone = tone_decode(column_freq, row_freq, tolerance)
 
[ column_freq, row_freq ] = find_tone_freq(tone_3,fsample,figure_num+3)
tone = tone_decode(column_freq, row_freq, tolerance)
 
[ column_freq, row_freq ] = find_tone_freq(tone_4,fsample,figure_num+4)
tone = tone_decode(column_freq, row_freq, tolerance)
 
[ column_freq, row_freq ] = find_tone_freq(tone_5,fsample,figure_num+5)
tone = tone_decode(column_freq, row_freq, tolerance)
 
 
 
[ column_freq, row_freq ] = find_tone_freq(tone_6,fsample,figure_num+6)
tone = tone_decode(column_freq, row_freq, tolerance)
 
[ column_freq, row_freq ] = find_tone_freq(tone_7,fsample,figure_num+7)
tone = tone_decode(column_freq, row_freq, tolerance)
 
[ column_freq, row_freq ] = find_tone_freq(tone_8,fsample,figure_num+8)
tone = tone_decode(column_freq, row_freq, tolerance)
 
[ column_freq, row_freq ] = find_tone_freq(tone_9,fsample,figure_num+9)
tone = tone_decode(column_freq, row_freq, tolerance)
 
[ column_freq, row_freq ] = find_tone_freq(tone_hash,fsample,figure_num+10)
tone = tone_decode(column_freq, row_freq, tolerance)
 
[ column_freq, row_freq ] = find_tone_freq(tone_star,fsample,figure_num+11)
tone = tone_decode(column_freq, row_freq, tolerance)

