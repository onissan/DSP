Function [sequence] = sequence_decode(tone, Fs)
% function sequence_decode(tone, Fs) this function takes an input tone and sampling % frequency 
% Inputs:
% tone = sampled values of the tone to be analyzed 
% Fs = sampling frequency 
% Outputs:
% sequence = array of the decoded sequence values 
% returns 
% Developed by: Zoe Hay and Omri Nissan
% Revised: 1/30/18

y = tone;
figure(figure_num);
spectrogram(y,300,150,700,Fs)
view(-77,72)
title('Spectrogram of Test Case ' + string(figure_num))
shading interp
colorbar off
 
start_index=0;%start at beginning of tone
n_samples=length(tone);
total_time=n_samples/Fs;
n_tone_length=0.1*Fs;%take increments of 0.1 seconds to examine
sub_tone=tone(1:n_tone_length);
 
%process the first 0.1 and look for tone
[ c_freq, r_freq ] = find_tone_freq(sub_tone,Fs,2);
next_decode = tone_decode(c_freq, r_freq, .02);
index=n_tone_length;
 
%prev_tone = next_decode;
fig_n=figure_num+1;
%x=0;%index<=(n_samples-n_tone_length)
sequence = [];
%if not noise increment count (count of tones found), 
%set end_tone (indicator of a break between tones) false,
%and print the decoded tone
if(~strcmp(next_decode,'error'))
    next_decode;
    count = 1;
    end_tone=0;
    sequence=[next_decode];
    
%if it is noise, count is still 0, 
%and end_tone is now true
else
    count = 0;
    end_tone=1;
end
 
%continue to process the tone while you havent reached the end of the tone
%and you haven't found more than 10 tones yet
while (index<=(n_samples-n_tone_length)&(count<10))
    fig_n=fig_n+1;
    %the next tone starts at the end of the last and is the same length
    next_sub_tone=tone(index:(index+n_tone_length));
    %plot_DFT_mag(next_sub_tone,Fs,fig_n); 
    fft_tone = abs(fft(next_sub_tone));
   
    [ c_freq, r_freq, mag_row_index ] = find_tone_freq(next_sub_tone,Fs,fig_n+1);
    next_decode = tone_decode(c_freq, r_freq, .02);
    %if its noise, set end_tone true
    if (strcmp(next_decode,'error')& mag_row_index<36)
        end_tone=1;
    end
    %if not noise, you already found the end tone, and the magnitude is larger than
    %noise, print the decoded tone, increment the count of tones found, and set end_tone false
    if (~strcmp(next_decode,'error'))
        if(end_tone==1 & mag_row_index>36)
            
        next_decode;
        count=count+1;
        prev_tone=next_decode;
        end_tone=0;
        sequence = [sequence, next_decode];
    
        end 
    end 
    %increment the starting index by the length of the previously processed
    %sample
    index=(index+n_tone_length); 
   
end
if(count~=7 & count<10)
    warning = "Error - Invalid Sequence"
end 

