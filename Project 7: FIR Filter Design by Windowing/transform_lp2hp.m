function hnhp = transform_lp2hp(hnlp)
       %hnlp - low-pass filter impulse response values (any odd length)
       %hnhp - high-pass filter impulse response, with same cutoff freq Fc
M=length(hnlp)
[dn, n] = unit_sample(M)
 
for(i=1:1:M)
if (i==(M-1)/2)
    hnhp(i)=hnlp(i)+1;
else
hnhp(i) = - hnlp(i);
end
end 