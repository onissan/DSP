
function [ DFTx, Fd ]=plot_DFT_mag(x,fsample,figure_num);
%[ DFTx, Fd ]=plot_DFT_mag(x,fsample,figure_num);
%where the input arguments are:
%x = time domain samples of a discrete-time sequence fsample = sampling frequency (samples / second) figure_num = number of the figure to use for the two plots
%and the outputs are:
%DFTx = DFT spectrum values (complex) [same # samples as x]
%Fd = Digital frequency values for each DFT sample
 
%DFT of x
DFTx = fft(x);
Fd = [0:(length(x)-1)]./length(x);

% Open a new Figure:
figure(figure_num)
%Plot Magnitude vs. Digital Frequency
subplot(2,1,1)  % Display plots in 2 rows / 1 column; This is the 1st plot.
stem(Fd,(abs(DFTx)./length(x)),'.');
grid on
title('Magnitude vs. Digital Frequency')
ylabel('DFT Spectrum Value')
xlabel('Digital Frequency F (cycles/sample)')
 
%Plot Magnitude vs. Analog Frequency
subplot(2,1,2) % Display plots in 2 rows / 1 column; This is the 2nd plot.
stem(Fd.*fsample,(abs(DFTx)./length(x)),'.');
grid on
title('Magnitude vs. Analog Frequency')
ylabel('DFT Spectrum Value')
xlabel('Analog Frequency F (cycles/second)')
end
