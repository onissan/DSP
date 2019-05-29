function limit_cycles_test( A1 , num_of_bits , number_of_samples , fig_num)
% function [ y , y_q ] = limit_cycles_test( A1 , num_of_bits , number_of_samples , fig_num)
% Input parameters (arguments) are:
% A1            	   = feedback loop filter coefficient
% num_of_bits   	   = the number of bits for the multiplier output quantization
% number_of_samples = the length of the unit sample response sequence
% number_of_samples = figure number
 
 
% Output values returned are:
%   y   = unquantized unit sample responses
%   y_q = quantized unit sample responses
% Developed by: Zoe Hay and Omri Nissan
% Revised: 2/24/18
 
dn = zeros(1,number_of_samples); %initialize array of all zeros
dn(1)=1; %assign first value 1
n = [0:1:number_of_samples-1]; %create sample index array starting at zero with increment of 1 
 
% Create empty arrays for both
y = []; 
y_q = [];
 
% Initialize previous value to zero
y_prev = 0;
y_prev_q = 0; 
 
% Calculate the output values for unquantized and quantized filters
for i = 1:number_of_samples
	
	y = [y ; dn(i) - (A1 * y_prev)]; % Unquantized filter
	y_q = [y_q ; dn(i) - (round((A1 * y_prev_q) * (2^num_of_bits)) / (2^num_of_bits))]; % Quantized filter
	
	% Reassigns a new previous output
	y_prev = y(i);
    y_prev_q = y_q(i);
	
end
 
% Plot the unit sample response sequences for both unquantized and
% quantized outputs
figure(fig_num)
hold all
stem(n , y , 'b' );
stem(n , y_q , 'r' );
grid on
legend('Full Precision' , strcat('Quantized to ' , num2str( num_of_bits) , ' bits') )
title(strcat('LIMIT CYCLES IN IIR FILTER (A1=' , num2str(A1), ')'))
 
end


