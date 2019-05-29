%% DFT Magnitude vs. Frequency: Cosine function: freq = 8 Hz, Phase = 0, Amplitude = 1, fsample = 20Hz, # samples = 100

% function function [t,x] = cosine_gen(A, fa, Fs, theta);
[t1,x1] = cosine_gen(1,8,20,0,100);
%[ DFTx, Fd ]=plot_DFT_mag(x,fsample,figure_num);
plot_DFT_mag(x1,20,1);

%% DFT Magnitude vs. Frequency: Cosine function: freq= 10 Hz, phase=0, amplitude=1, fsample= 20 Hz, # samples=100;  

% function function [t,x] = cosine_gen(A, fa, Fs, theta);
[t1,x1] = cosine_gen(1,10,20,0,100);
%[ DFTx, Fd ]=plot_DFT_mag(x,fsample,figure_num);
plot_DFT_mag(x1,20,1);

%% DFT Magnitude vs. Frequency: Cosine function: freq= 12 Hz, phase=0, amplitude=1, fsample= 20 Hz, # samples=100; 	 

% function function [t,x] = cosine_gen(A, fa, Fs, theta);
[t1,x1] = cosine_gen(1,12,20,0,100);
%[ DFTx, Fd ]=plot_DFT_mag(x,fsample,figure_num);
plot_DFT_mag(x1,20,1);

%% DFT Magnitude vs. Frequency: Cosine function: freq= 7.05 Hz, phase=0, amplitude=1, fsample= 20 Hz, # samples=100; 

% function function [t,x] = cosine_gen(A, fa, Fs, theta);
[t1,x1] = cosine_gen(1,7.05,20,0,100);
%[ DFTx, Fd ]=plot_DFT_mag(x,fsample,figure_num);
plot_DFT_mag(x1,20,1);

%% DFT Magnitude vs. Frequency: Cosine function: freq= 7.05 Hz, phase=0, amplitude=1, fsample= 20 Hz, # samples=100 added to Cosine function: freq=8.17 Hz, phase=0, amplitude=0.25, fsample= 20 Hz, # samples=100; 

% function function [t,x] = cosine_gen(A, fa, Fs, theta);
[t1,x1] = cosine_gen(1,7.05,20,0,100);
[t2,x2] = cosine_gen(0.25,8.17,20,0,100);
 
%[ DFTx, Fd ]=plot_DFT_mag(x,fsample,figure_num);
plot_DFT_mag((x1+x2),20,1);

%% DFT Magnitude vs. Frequency: Cosine function: freq= 7.05 Hz, phase=0, amplitude=1, fsample= 20 Hz, # samples=100 added to Cosine function: freq=8.17 Hz, phase=0, amplitude=0.25, fsample= 20 Hz, # samples=100 {Same as (5)}, but multiplied by a Blackman window (100 point window). xn .* blackman(100).? (window functions must be transposed by .? operator.) 	

% function function [t,x] = cosine_gen(A, fa, Fs, theta);
[t1,x1] = cosine_gen(1,7.05,20,0,100);
[t2,x2] = cosine_gen(0.25,8.17,20,0,100);
 
%[ DFTx, Fd ]=plot_DFT_mag(x,fsample,figure_num);
plot_DFT_mag(((x1+x2).*blackman(100).'),20,1);

%% DFT Magnitude vs. Frequency:  Cosine function: freq= 7.05 Hz, phase=0, amplitude=1, fsample= 20 Hz, # samples=200 added to Cosine function: freq=8.17 Hz, phase=0, amplitude=0.25, fsample= 20 Hz, # samples=200; {Same as (5)}, but # samples = 200; [2 signals, 200 samples, no window] 	

% function function [t,x] = cosine_gen(A, fa, Fs, theta);
[t1,x1] = cosine_gen(1,7.05,20,0,200);
[t2,x2] = cosine_gen(0.25,8.17,20,0,200);
 
%[ DFTx, Fd ]=plot_DFT_mag(x,fsample,figure_num);
plot_DFT_mag((x1+x2),20,1);

%% DFT Magnitude vs. Frequency: Cosine function: freq= 7.05 Hz, phase=0, amplitude=1, fsample= 20 Hz, # samples=100 added to Cosine function: freq=8.17 Hz, phase=0, amplitude=0.25, fsample= 20 Hz, # samples=100; 	 {Same as (5)}, but multiplied by a Blackman window (100 point window). xn .* blackman(100).? (window functions must be transposed by .? operator.){ Same as (6)}, but # samples = 200; [2 signals, 200 samples, with window] 	

% function function [t,x] = cosine_gen(A, fa, Fs, theta);
[t1,x1] = cosine_gen(1,7.05,20,0,200);
[t2,x2] = cosine_gen(0.25,8.17,20,0,200);
 
%[ DFTx, Fd ]=plot_DFT_mag(x,fsample,figure_num);
plot_DFT_mag(((x1+x2).*blackman(200).?),20,1);

%% DFT Magnitude vs. Frequency: Cosine function: freq= 7.05 Hz, phase=0, amplitude=1, fsample= 20 Hz, # samples=200 added to Cosine function: freq= 7.25 Hz, phase=0, amplitude=1, fsample= 20 Hz, # samples=200;

% function function [t,x] = cosine_gen(A, fa, Fs, theta);
[t1,x1] = cosine_gen(1,7.05,20,0,200);
[t2,x2] = cosine_gen(1,7.25,20,0,200);
 
%[ DFTx, Fd ]=plot_DFT_mag(x,fsample,figure_num);
plot_DFT_mag((x1+x2)),20,1);


%% DFT Magnitude vs. Frequency: Cosine function: freq= 7.05 Hz, phase=0, amplitude=1, fsample= 20 Hz, # samples=200 added to Cosine function: freq= 7.25 Hz, phase=0, amplitude=1, fsample= 20 Hz, # samples=200; {Same as (9)}, but multiplied by a Blackman window (200 point window)

% function function [t,x] = cosine_gen(A, fa, Fs, theta);
[t1,x1] = cosine_gen(1,7.05,20,0,200);
[t2,x2] = cosine_gen(1,7.25,20,0,200);
 
%[ DFTx, Fd ]=plot_DFT_mag(x,fsample,figure_num);
plot_DFT_mag(((x1+x2).*blackman(200).?),20,1);

%% DFT Magnitude vs. Frequency: Unit sample sequence: # samples = 40; fsample= 1 KHz; 

% function function [t,x] = cosine_gen(A, fa, Fs, theta);
[dn,n] = unit_sample(40)
 
%[ DFTx, Fd ]=plot_DFT_mag(x,fsample,figure_num);
plot_DFT_mag(dn,1000,1);

%% DFT Magnitude vs. Frequency: Unit sample response of the filter with difference equation y[n] = 0.2x[n] + 0.2x[n-1] + 0.2x[n-2] + 0.2x[n-3] + 0.2x[n-4] # samples = 40; fsample= 1 KHz; 

% function function [t,x] = cosine_gen(A, fa, Fs, theta);
Ak = [0.2, 0.2, 0.2, 0.2, 0.2]
Bk = [1,0,0,0,0]
[poles,zeros,HF,Fd,hn,n] = show_filter_responses(Ak,Bk,1000,40,40,2);
 
%[ DFTx, Fd ]=plot_DFT_mag(x,fsample,figure_num);
plot_DFT_mag(hn,1000,1);
