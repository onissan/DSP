%This script creates a single figure showing the time domain waveforms of all for %example signals

Fs=50000
t1=[0:(length(TxPulse)-1)]/Fs;
figure(1);
subplot(2,2,1);
plot(t1,TxPulse);
grid on
title('Time-Domain Waveform of TxPulse Signal')
ylabel('Signal Magnitude')
xlabel('Time (sec)')
subplot(2,2,2);
 
t2=[0:(length(TyphoonSubEcho)-1)]/Fs;
plot(t2,TyphoonSubEcho);
grid on
title('Time-Domain Waveform of TyphoonSubEcho Signal')
ylabel('Signal Magnitude')
xlabel('Time (sec)')
 
t3=[0:(length(AkulaSubEcho)-1)]/Fs;
subplot(2,2,3);
plot(t3,AkulaSubEcho);
grid on
title('Time-Domain Waveform of AkulaSubEco Signal')
ylabel('Signal Magnitude')
xlabel('Time (sec)')
 
t4=[0:(length(LosAngelesSubEcho)-1)]/Fs;
subplot(2,2,4);
plot(t4,LosAngelesSubEcho);
grid on
title('Time-Domain Waveform of LosAngelesSubEcho Signal')
ylabel('Signal Magnitude')
xlabel('Time (sec)')

%This script creates a single figure showing the DFT spectrum of all for example %signals
fsample=50000
 
figure(1);
subplot(2,2,1);
[Fa1,DFT_mag1]= DFT_plot_data(TxPulse,fsample);
stem(Fa1,DFT_mag1,'.');
grid on
title('Magnitude of TxPulse Signal vs. Analog Frequency')
ylabel('DFT Spectrum Value')
xlabel('Analog Frequency F (cycles/second)')
 
 
subplot(2,2,2);
[Fa2,DFT_mag2]= DFT_plot_data(TyphoonSubEcho,fsample);
stem(Fa2,DFT_mag2,'.');
grid on
title('Magnitude of TyphoonSubEcho Signal vs. Analog Frequency')
ylabel('DFT Spectrum Value')
xlabel('Analog Frequency F (cycles/second)')
 
subplot(2,2,3);
[Fa3,DFT_mag3]= DFT_plot_data(AkulaSubEcho,fsample);
stem(Fa3,DFT_mag3,'.');
grid on
title('Magnitude of AkulaSubEcho Signal vs. Analog Frequency')
ylabel('DFT Spectrum Value')
xlabel('Analog Frequency F (cycles/second)')
 
subplot(2,2,4);
[Fa4,DFT_mag4]= DFT_plot_data(LosAngelesSubEcho,fsample);
stem(Fa4,DFT_mag4,'.');
grid on
title('Magnitude of LosAngelesSubEcho Signal vs. Analog Frequency')
ylabel('DFT Spectrum Value')
xlabel('Analog Frequency F (cycles/second)')
 
 
function [Fa,DFT_mag]= DFT_plot_data(x,fsample)
DFTx = fft(x);
Fd = [0:(length(x)-1)]./length(x);
length(x);
 
Fa=Fd.*fsample;
DFT_mag=(abs(DFTx)./length(x));
end 


