%This Matlab script designs 5 filters of the same specifications using 5 different design %methods. The filter magnitude responses of each design are plotted in two composite plots. %Figure 1 plots on a linear magnitude scale, Figure 2 plots in dB magnitude. Each figure has 2 %subplots, one focused on the full frequency range and stop band ripple, the other shows detail %of the passband ripple  
%PM
fsample = 1000;
f = [ 2*0.1333, 2*0.2667];
a = [ 1 0 ];
dev = [ .0130 .0130];
[n,fo,ao,w] = firpmord(f,a,dev);
b = firpm(n,fo,ao);
num_of_f_points = 3000;
 
[HF1, W] = freqz(b, a, num_of_f_points); %second and third figures use previously written function to plot frequency responses: one against digital frequency and one with H(F) in dB against analog frequency
Fd = W/(2*pi); %generate the digital frequencies
 
%Butterworth
Wp = 2*0.1333;
Ws = 2*0.2667;
Rp = 0.114;
Rs = 37.3;
[N, Wn] = buttord(Wp, Ws, Rp, Rs)
[b,a] = butter(N,Wn);
 
[HF2, W] = freqz(b, a, num_of_f_points); % generate frequency response from coefficients
 
 
%Cheby 1
Fp=0.133;
Fs = 0.267;
Wp = 2*Fp;
Ws = 2*Fs;
Rp = 0.114;
Rs = 37.7;
[N_chevy1, Wp_chevy1] = cheb1ord(Wp, Ws, Rp, Rs)
[B_chevy1,A_chevy1] = cheby1(N_chevy1,Rp,Wp_chevy1);
[HF3, W] = freqz(B_chevy1, A_chevy1, num_of_f_points); % generate frequency response from coefficients
 
%Cheby 2
Fp=0.133;
Fs = 0.267;
Wp = 2*Fp;
Ws = 2*Fs;
Rp = 0.114;
Rs = 37.7;
[N_chevy2, Wp_chevy2] = cheb2ord(Wp, Ws, Rp, Rs)
[B_chevy2,A_chevy2] = cheby2(N_chevy2,Rs,Wp_chevy2);
[HF4, W] = freqz(B_chevy2, A_chevy2, num_of_f_points); % generate frequency response from coefficients
 
%Elliptical
Fp=0.133;
Fs = 0.267;
Wp = 2*Fp;
Ws = 2*Fs;
Rp = 0.114;
Rs = 37.7;
[N_ellip, Wp_ellip] = ellipord(Wp, Ws, Rp, Rs);
[B_ellip,A_ellip] = ellip(N_ellip,Rp,Rs,Wp_ellip);
[HF5, W] = freqz(B_ellip, A_ellip, num_of_f_points);% generate frequency response from coefficients
 
% Open a new Figure #1:
figure(1)
% Plot the Magnitude Response 
subplot(2,1,1)  % Display plots in 2 rows / 1 column; This is the 1st plot.
 
% Plot the magnitude of HF on a linear scale
hold all
plot(Fd, abs(HF1));
plot(Fd, abs(HF2));
plot(Fd, abs(HF3));
plot(Fd, abs(HF4));
plot(Fd, abs(HF5));
grid on
axis([0 0.5 0 0.05])% Set axis to show 0<|H|<0.05, frequencies from 0-0.5 cycles/sample
legend('Parks-McClellan','Butterworth','Chebyshev 1','Chebyshev 2','Elliptical')
xlabel('Digital Frequency  F (cycles/sample)')
ylabel('Magnitude Response')
title('Linear Scale Frequency Response of Filter Stop Band')
 
% Plot the Phase Response below the Magnitude Response
subplot(2,1,2) % Display plots in 2 rows / 1 column; This is the 2nd plot.
% Plot the magnitude of HF on a linear scale
hold all
plot(Fd, abs(HF1));
plot(Fd, abs(HF2));
plot(Fd, abs(HF3));
plot(Fd, abs(HF4));
plot(Fd, abs(HF5));
grid on
axis([0 0.25 0.95 1.05])% Set axis to show 0<|H|<0.25, frequencies from 0-0.25 cycles/sample
legend('Parks-McClellan','Butterworth','Chebyshev 1','Chebyshev 2','Elliptical')
xlabel('Digital Frequency  F (cycles/sample)')
ylabel('Magnitude Response')
title('Linear Scale Frequency Response of Filter Passband')
 
 
 
% PLOT dB (LOG AMPLITUDE) SCALE FREQUENCY RESPONSE PLOT in a new figure
% copy, paste, modify plot commands from above
% Plot the magnitude and phase responses on a linear freq scale
 
% Open a new Figure #2:
figure(2)
% Plot the Magnitude Response 
subplot(2,1,1)  % Display plots in 2 rows / 1 column; This is the 1st plot.
 
% Plot the magnitude of HF on a dB scale
hold all
plot(Fd, 20*log10(abs(HF1)));
plot(Fd, 20*log10(abs(HF2)));
plot(Fd, 20*log10(abs(HF3)));
plot(Fd, 20*log10(abs(HF4)));
plot(Fd, 20*log10(abs(HF5)));
grid on
axis([0 0.5 -50 10])% Set axis to show -50dB<|H|<10dB, frequencies from 0-0.5 cycles/sample
legend('Parks-McClellan','Butterworth','Chebyshev 1','Chebyshev 2','Elliptical')
xlabel('Digital Frequency  F (cycles/sample)')
ylabel('Magnitude Response (dB)')
title('dB Scale Frequency Response of Filter Stop Band')
 
% Plot the Phase Response below the Magnitude Response
subplot(2,1,2) % Display plots in 2 rows / 1 column; This is the 2nd plot.
 
% Plot the magnitude of HF on a dB scale
hold all
plot(Fd, 20*log10(abs(HF1)));
plot(Fd, 20*log10(abs(HF2)));
plot(Fd, 20*log10(abs(HF3)));
plot(Fd, 20*log10(abs(HF4)));
plot(Fd, 20*log10(abs(HF5)));
grid on
axis([0 0.25 -0.5 0.5])% Set axis to show -0.5dB<|H|<0.0.5dB, frequencies from 0-0.25 cycles/sample
legend('Parks-McClellan','Butterworth','Chebyshev 1','Chebyshev 2','Elliptical')
xlabel('Digital Frequency  F (cycles/sample)')
ylabel('Magnitude Response (dB)')
title('dB Scale Frequency Response of Filter PassBand')
