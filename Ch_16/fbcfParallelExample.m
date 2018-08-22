% FBCFPARALLELEXAMPLE
% This script uses parallel feed-back comb filter (FBCF)
% functions, applied to an acoustic guitar recording.
%
% See also FBCFSERIESEXAMPLE
clear;clc;

[in,Fs] = audioread('AcGtr.wav');

maxDelay = ceil(.07*Fs);  % max delay of 70 ms
buffer1 = zeros(maxDelay,1); 
buffer2 = zeros(maxDelay,1); 

d1 = fix(.047*Fs); % 47 ms of delay
g1 = 0.5;
d2 = fix(.053*Fs); % 53 ms of delay
g2 = -0.5;

rate1 = 0.6; % Hz (frequency of LFO)
amp1 = 6; % Range of +- 6 samples for delay
rate2 = 0.5; % Hz (frequency of LFO)
amp2 = 8; % Range of +- 8 samples for delay

% Initialize Output Signal
N = length(in);
out = zeros(N,1);

for n = 1:N
    
    % Two Parallel FBCFs
    [w1,buffer1] = fbcf(in(n,1),buffer1,Fs,n,...
        d1,g1,amp1,rate1);
    % Both FBCFs receive "in" to create
    % parallel processing
    [w2,buffer2] = fbcf(in(n,1),buffer2,Fs,n,...
        d2,g2,amp2,rate2);
    % The output of each FBCF is summed together
    % to complete parallel processing
    out(n,1) = w1 + w2;
end

sound(out,Fs);

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
