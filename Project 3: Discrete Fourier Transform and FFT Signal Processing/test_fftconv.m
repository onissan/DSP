%% TEST 1:
 
xn1 = [0,0,1,1,1,1,0,0, 0]
hn1 = fir1(10, 0.7, rectwin(11))
yn1 = fftconv([0,0,0,1,1,1,1,0, 0],fir1(10, 0.7, rectwin(11)))
 
Mx1 = length(xn1);
Mh1 = length(hn1);
M1 = Mx1+Mh1 -1;
 
% Optimize the number of padding for faster processing using length divisible
%by 2)
Mfft1 = 2.^nextpow2(M1);
 
%DFT of xn1
DFTx1 = fft(xn1, Mfft1);
DFTh1 = fft(hn1, Mfft1);
DFTy1 = fft(yn1, Mfft1);
 
Fd1 = [0:(Mfft1-1)]./(Mfft1);
 
figure(1)
subplot(3,2,1)
stem([0:(length(xn1)-1)],xn1)
grid on
title('x[n] Sequence')
ylabel('Amplitude')
xlabel('Sample n')
 
subplot(3,2,3) 
stem([0:(length(hn1)-1)],hn1)
grid on
title('h[n] Sequence')
ylabel('Amplitude')
xlabel('Sample n')
 
subplot(3,2,5) 
stem([0:(length(yn1)-1)],yn1)
grid on
title('y[n] Sequence')
ylabel('Amplitude')
xlabel('Sample n')
xlim([0 18])
 
%Plot Magnitude vs. Digital Frequency
subplot(3,2,2) 
plot(Fd1,(abs(DFTx1)));
grid on
title('x[k] Spectrum')
ylabel('Magnitude Response')
xlabel('Digital Frequency - cycles/sample')
 
%Plot Magnitude vs. Digital Frequency
subplot(3,2,4) 
plot(Fd1,(abs(DFTh1)));
grid on
title('h[k] Spectrum')
ylabel('Magnitude Response')
xlabel('Digital Frequency - cycles/sample')
 
%Plot Magnitude vs. Digital Frequency
subplot(3,2,6) 
plot(Fd1,(abs(DFTy1)));
grid on
title('y[k] Spectrum')
ylabel('Magnitude Response')
xlabel('Digital Frequency - cycles/sample')
 
%% TEST 2:
 
xn2 = hann(9)
hn2 = [ 0 0 1 0 0 0 0 1 0 0]
yn2 = fftconv([0,0,0,1,1,1,1,0, 0],fir1(10, 0.7, rectwin(11)))
 
Mx2 = length(xn1);
Mh2 = length(hn1);
M2 = Mx2+Mh2 -1;
 
% Optimize the nuM1ber of padding for faster processing using length divisible
%by 2)
Mfft2 = 2.^nextpow2(M2);
 
%DFT of xn1
DFTx2 = fft(xn2, Mfft2);
DFTh2 = fft(hn2, Mfft2);
DFTy2 = fft(yn2, Mfft2);
 
Fd2 = [0:(Mfft2-1)]./(Mfft2);
 
figure(2)
subplot(3,2,1)
stem([0:(length(xn2)-1)],xn2)
grid on
title('x[n] Sequence')
ylabel('Amplitude')
xlabel('Sample n')
 
subplot(3,2,3) 
stem([0:(length(hn2)-1)],hn2)
grid on
title('h[n] Sequence')
ylabel('Amplitude')
xlabel('Sample n')
 
subplot(3,2,5) 
stem([0:(length(yn2)-1)],yn2)
grid on
title('y[n] Sequence')
ylabel('Amplitude')
xlabel('Sample n')
 
%Plot Magnitude vs. Digital Frequency
subplot(3,2,2) 
plot(Fd2,(abs(DFTx2)));
grid on
title('x[k] Spectrum')
ylabel('Magnitude Response')
xlabel('Digital Frequency - cycles/sample')
 
%Plot Magnitude vs. Digital Frequency
subplot(3,2,4) 
plot(Fd2,(abs(DFTh2)));
grid on
title('h[k] Spectrum')
ylabel('Magnitude Response')
xlabel('Digital Frequency - cycles/sample')
 
%Plot Magnitude vs. Digital Frequency
subplot(3,2,6) 
plot(Fd2,(abs(DFTy2)));
grid on
title('y[k] Spectrum')
ylabel('Magnitude Response')
xlabel('Digital Frequency - cycles/sample')
 

