function [dn, n] = unit_sample(number_of_samples)
% function [dn, n] = unit_sample(number_of_samples);
% Input parameters (arguments) are:
% number_of_samples = How long your sequence to be
 
% Output values returned are:
%   n = An array of the indexes corresponding to the dn values, starting at 0
%   dn = Unit sample sequence values
% Developed by: Zoe Hay and Omri Nissan 
% Revised: 1/9/17

dn = zeros(1,number_of_samples); %initialize array of all zeros
dn(1)=1; %assign first value 1
n = [0:1:number_of_samples-1] %create sample index array starting at zero with increment of 1 		
					 				
%calls the unit_sample function and plots the results
[dn, n]=unit_sample(16);
figure(1);
stem(n, dn, '.', 'LineWidth', 3);
grid on
xlabel('Sample Index Value')
ylabel('Unit Sample Sequence Value')
title('Unit Sample Sequence Length = 16')
