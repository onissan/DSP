function [Ak,Bk,HF,Fd,hn,n]=show_filter_responses_pz(poles,zeros,K,...
fsample,num_of_f_points, num_of_n_points,figure_num);
% function [Ak,Bk,HF,Fd,hn,n]=show_filter_responses_pz(poles,zeros,K,...
%   fsample,num_of_f_points, num_of_n_points,figure_num);
 
% Input parameters (arguments) are:
% poles = a list of the Z plane locations (complex values) for all the POLES of the filter (a row vector)
% zeros = a list of the Z plane locations (complex values) for all the ZEROS of the filter (a row vector)
% K = Multiplier constant for the transfer function (which you should multiply H(z) by)
% fsample = sampling frequency (samples / second)
% num_of_f_points = the # of points for the freq. response plot
% num_of_n_points = the # of points for the unit sample response plot
% figure_num = number of the 1st figure to use for plots
 
% Output values returned are:
%   Ak = a list of the Ak coefficients of the filter difference equation (coefficients of the ?y? terms)
%   Bk = a list of the Bk coefficients of the filter difference equation (coefficients of the ?x? terms)
%   HF = the DTFT frequency response values (linear scale)
%   Fd = digital frequencies that match the freq response values
%   hn = has the unit sample response sequence values
%   n = has the corresponding sample indices (0 to [num_of_n_points ? 1]);
 
% Developed by: Zoe Hay and Omri Nissan
% Revised: 1/21/18
 
Ak = poly(poles)%use poly function to find poles and zeros from Ak and Bk coefficients
Bk = K*poly(zeros)%scale transfer function by K value
[HF,Fd,hn,n] = show_filter_responses(Ak,Bk,fsample,num_of_f_points,num_of_n_points,figure_num); %uses previously defined function to generate pole/zero plot, frequency response plots, and unit sample response
 
end	