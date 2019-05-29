function [t,x] = cosine_gen(A, fa, Fs, theta)
% function function [t,x] = cosine_gen(A, fa, Fs, theta);
% Input parameters (arguments) are:
% A = Amplitude of the sinusoidal signal
% fa = Analog Frequency (Hz)
% Fs = Sampling Rate (samples/sec)
% theta = Phase Shift (radians)

% Output values returned are:
%   x = A cos( 2*pi*fa*t + theta )
%   t = range for the sinusoidal signal
% Developed by: Zoe Hay and Omri Nissan 
% Revised: 1/9/17

% Define the sampled time range depending on the 
t = [0 : 1/(Fs*.5) : 0.5];

% Create the new sinuosidal using the input phase and amplitude
x = A*cos(2*pi*fa.*t + theta);

end
