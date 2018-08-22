% FIR1EXAMPLE
% This script demonstrates the various uses of 
% the 'fir1' filter function
%
% See also FIR1

% Declare initial parameters for LPF and HPF
n = 12; % order of filter = # of delay lines + 1
f = 6000; % cut-off frequency (Hz)
Fs = 48000; nyq = Fs/2;
Wn = f/nyq;

% Syntax for low-pass filter
h_lpf = fir1(n,Wn); % optionally, h = fir1(n,Wn,'low'); 

% Syntax for high-pass filter
h_hpf = fir1(n,Wn,'high'); 


% Declare second frequency for BPF and BSF
f2 = 18000;
Wn2 = f2/nyq;


% Syntax for band-pass filter
h_bpf = fir1(n,[Wn Wn2]); 

% Syntax for band-stop filter
h_bsf = fir1(n,[Wn Wn2],'stop'); 


% Plots
figure(1); freqz(h_lpf); % Low-pass filter
figure(2); freqz(h_hpf); % High-pass filter
figure(3); freqz(h_bpf); % Band-pass filter
figure(4); freqz(h_bsf); % Band-stop filter

% This source code is provided without any warranties as published in 
% "Hack Audio: An Introduction to Computer Programming and Digital Signal
% Processing in MATLAB" © 2019 Taylor & Francis.
% 
% It may be used for educational purposes, but not for commercial 
% applications, without further permission.
%
% Book available here (uncomment):
% url = ['https://www.routledge.com/Hack-Audio-An-Introduction-to-'...
% 'Computer-Programming-and-Digital-Signal/Tarr/p/book/9781138497559'];
% web(url,'-browser');
% 
% Companion website resources (uncomment):
% url = 'http://www.hackaudio.com'; 
% web(url,'-browser');

