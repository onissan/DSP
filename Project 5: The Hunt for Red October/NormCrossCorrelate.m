
function Cxy = NormCrossCorrelate(xn,yn)
%find the energy in each signal = the summ of the squared signal values
Exn = sum(abs(xn).^2);
Eyn = sum(abs(yn).^2);
 
%find the cross correlation of the two signals
rxy = corrconv(xn,yn);
%rxx = corrconv(xn,xn);
%ryy = corrconv(yn,yn);
%Cxy = rxy./(sqrt(rxx(1)*ryy(1)));
 
%result is the cross correlation normalized by the energy 
Cxy = rxy./(sqrt(Exn.*Eyn));
 
figure(3);
subplot(3,1,1);
plot(xn);
grid on
title('Input Signal xn')
ylabel('Signal Magnitude')
xlabel('Index')
 
subplot(3,1,2);
plot(yn);
grid on
title('Input Signal yn')
ylabel('Signal Magnitude')
xlabel('Index')
 
subplot(3,1,3);
plot(Cxy);
grid on
title('Normalized Cross-Correlation Function of Inputs, Cxy')
ylabel('Signal Magnitude')
xlabel('Index')
 
%subplot(4,1,4);
%plot(abs(hilbert(Cxy)));
 
