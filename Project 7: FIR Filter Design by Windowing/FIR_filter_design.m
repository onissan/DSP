
%% Initial Designs
 
M_init = 101; % Define filter length
 
ak = zeros(1,M_init); %initialize array of all zeros
ak(1)=1; %assign first value 1
 
hn_lp_init = FIR_Filter_By_Window (M_init,0.0850,blackman(M_init));
 
show_filter_responses(ak,hn_lp_init,44.1E3,44.1E3,M_init,1);
 
%% Optimize Designs
 
M_mod = 51; % Define filter length
 
ak = zeros(1,M_mod); %initialize array of all zeros
ak(1)=1; %assign first value 1
 
hn_lp_init = FIR_Filter_By_Window (M_mod,0.0850,chebwin(M_mod,60));
 
show_filter_responses(ak,hn_lp_init,44.1E3,44.1E3,M_mod,5);
