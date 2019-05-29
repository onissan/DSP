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
Mfft = 2.^nextpow2(M)
 
% Zero pad each sequence to the proper length, and find the FFT of each
Xk = fft(xn, Mfft)
Hk = fft(hn, Mfft)
 
% Perform the convolution by spectral multiplication
Yk = Xk.*Hk;
 
%Inverse transform result back to time domain
y = real(ifft(Yk));
 
yn = y(1:Mx+Mh-1)
 
end
