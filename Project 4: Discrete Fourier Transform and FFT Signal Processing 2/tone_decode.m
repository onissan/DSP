function tone = tone_decode(col_freq, row_freq, tolerance)
%function tone = tone_decode(col_freq, row_freq, tolerance)
%Input parameters
%col_freq = high frequency code
%row_freq = low frequency code
%tolerance = allowed tolerance for frequency match
%
%Output values
%tone = the decoded tone value
%
%Developed by: Zoe Hay and Omri Nissan
%Revised: 1/30/18
 
low_scale = 1 - tolerance;%scaling factors for tolerance on frequency match 
high_scale = 1 + tolerance;
 
%determine row
if(row_freq>697*low_scale & row_freq<697*high_scale)
    ROW = 1;
elseif (row_freq>770*low_scale & row_freq<770*high_scale)
    ROW = 2;
elseif(row_freq>852*low_scale & row_freq<852*high_scale)
    ROW = 3;
elseif((row_freq>941*low_scale & row_freq<941*high_scale)) 
    ROW = 4; 
else
    ROW = 5;
end   
 
%determine column
if(col_freq>1209*low_scale & col_freq<1209*high_scale)
    COL = 1;
elseif (col_freq>1336*low_scale & col_freq<1336*high_scale)
    COL = 2;
elseif(col_freq>1477*low_scale & col_freq<1477*high_scale)
    COL = 3;
elseif(col_freq>1633*low_scale & col_freq<1633*high_scale)
    COL = 4;
else
    COL = 5;
end   
 
%use row and column to find tone character    
if (ROW==1 & COL==1)
tone = '1';
elseif (ROW==1 & COL==2)
tone = '2';
elseif (ROW==1 & COL==3)
tone = '3';
 
elseif (ROW==2 & COL==1)
tone = '4';
elseif (ROW==2 & COL==2)
tone = '5';
elseif (ROW==2 & COL==3)
tone = '6';
 
elseif (ROW==3 & COL==1)
tone = '7';
elseif (ROW==3 & COL==2)
tone = '8';
elseif (ROW==3 & COL==3)
tone = '9';
 
elseif (ROW==4 & COL==1)
tone = '*';
elseif (ROW==4 & COL==2)
tone = '0';
elseif (ROW==4 & COL==3)
tone = '#';
else
    tone = 'error';
end
end               