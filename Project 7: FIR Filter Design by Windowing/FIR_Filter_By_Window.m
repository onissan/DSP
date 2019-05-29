
function hn_lp = FIR_Filter_By_Window (M,Fc,window)
% M = the filter length (odd)
% Fc = filter cutoff digital frequency (-6dB) (cycles/sample)
% window = the Matlab window function values to multiply h[n] by
% hn_lp = windowed impulse response values for the Low-pass FIR filter
 
hn_shift(M)=0;
% first generate ideal low-pass filter values using the sinc function definition 
for n=1:1:M 
    j=-((M-1)/2)-1+n;
    if (j==0)
        hn_shift(n) = 2*Fc;
    else
        hn_shift(n) = sin(2*pi*Fc*j)/(pi*j);
    end
End
% multiply the ideal sinc response by the selected window function 
hn_lp= hn_shift.*window.'
