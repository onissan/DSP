function  yn = corrconv( xn, hn )
% function  yn = corrconv( xn, hn) ;
%
% Input parameters (arguments) are:
% xn = first time sequence to be cross correlated
% hn = second time sequence to be cross correlated
%
% Output values returned are:
%   yn = cross correlation of xn and hn
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
Mfft = 2.^nextpow2(M);
 
% Zero pad each sequence to the proper length, and find the FFT of each
% take the complex conjugate of Hk to perform correlation
Xk = fft(xn, Mfft);
Hk = conj(fft(hn, Mfft));
 
% Perform the cross correlation by spectral multiplication
Yk = Xk.*Hk;
 
%Inverse transform result back to time domain
y = real(ifft(Yk));
 
yn = y(1:Mx+Mh-1);
 
end
