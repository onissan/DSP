% Define the Ak and Bk coefficients for notch filter
[Ak,Bk,HF,Fd,hn,n]= show_filter_responses_pz([0.95*exp(1i*2*pi*(1/48)),0.95*exp(-1i*2*pi*(1/48)),...
    0.95*exp(1i*2*pi*(2/48)),0.95*exp(-1i*2*pi*(2/48))],[exp(1i*2*pi*(1/48)),exp(-1i*2*pi*(1/48)),...
    exp(1i*2*pi*(2/48)),exp(-1i*2*pi*(2/48))],1/1.1065,48000,48000,40,1)
 
% Scale factor of 512
ScaleFactor=512;
 
% 40-point unit sample response
num_of_n_points = 40;
 
% 48000-point frequency response
num_of_f_points = 48000;
 
% Sampling rate of S = 48 kHz
fsample = 48000;
 
% Original C and M Filter coefficients
[M , C] = tf2latc(Bk,Ak)
 
% Quantized C and M Filter coefficients
M_q = round((M.*ScaleFactor))./ScaleFactor
C_q = round((C.*ScaleFactor))./ScaleFactor
 
% Generate a Unit sample sequence
[dn1,n1] = unit_sample(num_of_n_points); %generate unit sample sequence
 
% Determine the Unit Impulse Response for original and quantized data
[Y,G] =latcfilt(M,C,dn1)
 
[Y_q,G_q] =latcfilt(M_q,C_q,dn1)
 
% -------------------- Plotting Unit Impulse Response ----------------------
figure(5)
stem(n , Y)
grid on; title('A Unit Sample Response');
ylabel('Unit Sample Sequence Value');
xlabel('Sample Index Value');
 
figure(6)
stem(n , Y_q)
grid on; title('A Unit Sample Response');
ylabel('Unit Sample Sequence Value');
xlabel('Sample Index Value');
 
% -------------------- Plotting Frequency Response -------------------------
 
% Generate frequency response origenal M & C
[HF, W] = freqz(Y , 1 , num_of_f_points)
 
Fd = W/(2*pi); %generate the digital frequencies
 
plot_freq_responses(Fd, HF, fsample, 7)
 
% Generate frequency response quantized M & C
[HF_q, W_q] = freqz(Y_q , 1 , num_of_f_points)
 
Fd_q = W_q/(2*pi); %generate the digital frequencies
 
plot_freq_responses(Fd_q, HF_q, fsample, 9)


