function [hn, n]=unit_sample_response(Bk, Ak, number_of_samples, figure_number)
% function [hn, n]=unit_sample_response(Bk, Ak, number_of_samples, figure_number)
 
% Input parameters (arguments) are:
% Bk = a list of the Bk coefficients of the filter difference equation (coefficients of the ?x? terms)
% Ak = a list of the Ak coefficients of the filter difference equation (coefficients of the ?y? terms)
% number_of_samples = # of unit sample response sequence samples to find
% figure_num = number of the 1st figure to use for plots
 
% Output values returned are:
% hn = has the unit sample response sequence value
% n = has the corresponding sample indices (starting at 0);
 
% Developed by: Zoe Hay and Omri Nissan
% Revised: 1/21/18

[dn,n] = unit_sample(number_of_samples);%uses previously defined function to create array for unit sample sequence values 
hn = filter(Bk,Ak,dn);%filter function to evaluate hn unit sample response
figure(figure_number);
stem(n,hn,'.');%stem plot with ?.? at ends 
grid on
xlabel('Sample Index N')
ylabel('Unit Sample Response Value')
title('Unit Sample Response')		