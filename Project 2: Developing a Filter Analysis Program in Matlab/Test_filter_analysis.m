% Test Filter Analysis
 
% ----------- Start testing show_filter_responses --------------------
 
% Test case 1: y[n] = x[n] - 0.9 y[n-1]
[poles1a,zeros2a,HF1a,Fd1a,hn1a,n1a] = show_filter_responses([ 1, 0, 0 ],...
[ 0.5, 0, 0.5 ], 1000,500,50,1);
 
% Test case 2: y[n] = 0.5 x[n] + 0.5 x[n-2]
[poles2a,zeros2a,HF2a,Fd2a,hn2a,n2a] = show_filter_responses([ 1, 0 ],...
[ 1, -0.9 ],1000,500,50,5);
 
% Test case 3: y[n] = 0.5 x[n] + 0.5 x[n-1]
[poles4a,zeros4a,HF4a,Fd4a,hn4a,n4a] = show_filter_responses([ 1, 0 ],...
[ 0.5, 0.5 ], 1000,500,50,9);
 
% Test case 4: Poles at z=[0.7*j -0.7*j], Zeros at z=[-1 1], K=1
[poles4a,zeros4a,HF4a,Fd4a,hn4a,n4a] = show_filter_responses([ 1, 0, 0.49 ],...
[ 1, 0, -1 ],1000,500,50,13);
 
% ----------- Start testing show_filter_responses_pz --------------------
 
% Test case 1: y[n] = x[n] - 0.9 y[n-1]
[Ak1b,Bk1b,HF1b,Fd1b,hn1b,n1b]=show_filter_responses_pz([0],...
[0.9],1,1000,500,50,17);
 
% Test case 2: y[n] = 0.5 x[n] + 0.5 x[n-2]
[Ak2b,Bk2b,HF2b,Fd2b,hn2b,n2b]=show_filter_responses_pz([0 ; 0],...
[j, -j],0.5,1000,500,50,21);
 
% Test case 3: y[n] = 0.5 x[n] + 0.5 x[n-1]
[Ak3b,Bk3b,HF3b,Fd3b,hn3b,n3b]=show_filter_responses_pz([0],...
[-1],0.5,1000,500,50,25);
 
% Test case 4: Poles at z=[0.7*j -0.7*j], Zeros at z=[-1 1], K=1
[Ak4b,Bk4b,HF4b,Fd4b,hn4b,n4b]=show_filter_responses_pz([ -j*0.7 ; j*0.7 ],...
[ 1 ; -1 ],1,1000,500,50,29);
