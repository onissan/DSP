function plot_freq_responses(Fd, HF, fsample, figure_num)
% Open a new Figure #1:
figure(figure_num)
% Plot the Magnitude Response 
subplot(2,1,1)  % Display plots in 2 rows / 1 column; This is the 1st plot.
 
% Plot the magnitude of HF on a linear scale
plot(Fd, abs(HF));
grid on
xlabel('Digital Frequency  F (cycles/sample)')
ylabel('Magnitude Response')
title('Frequency Response of Filter')
 
% Plot the Phase Response below the Magnitude Response
subplot(2,1,2) % Display plots in 2 rows / 1 column; This is the 2nd plot.
 
% Plot the Phase Angle vs Digital Frequency     
plot(Fd,angle(HF)/(2*pi));   % Normalize angle radian values by pi radians
 
grid on
xlabel('Digital Frequency  F (cycles/sample)')
ylabel('Phase Response /pi')
 
 
% PLOT dB (LOG AMPLITUDE) SCALE FREQUENCY RESPONSE PLOT in a new figure
% copy, paste, modify plot commands from above
% Plot the magnitude and phase responses on a linear freq scale
 
% Open a new Figure #2:
figure(figure_num+1)
% Plot the Magnitude Response 
subplot(2,1,1)  % Display plots in 2 rows / 1 column; This is the 1st plot.
 
% Plot the magnitude of HF on a dB scale
plot(Fd.*fsample, 20*log10(abs(HF)));
grid on
xlabel('Analog Frequency  F (cycles/second)')
ylabel('Magnitude Response')
title('Frequency Response of Filter')
 
% Plot the Phase Response below the Magnitude Response
subplot(2,1,2) % Display plots in 2 rows / 1 column; This is the 2nd plot.
 
% Plot the Phase Angle vs Analog Frequency     
plot(Fd.*fsample,angle(HF)/(2*pi));   % Normalize angle radian values by pi radians
 
grid on
xlabel('Analog Frequency  F (cycles/second)')
ylabel('Phase Response /pi')
