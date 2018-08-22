% FBCFEXAMPLE
% This script uses a feed-back comb filter (FBCF)
% function, applied to an acoustic guitar recording. 
%
% See also FBCFNOMOD, FBCF
clear;clc;

[in,Fs] = audioread('AcGtr.wav');

maxDelay = ceil(.05*Fs);  % maximum delay of 50 ms
buffer = zeros(maxDelay,1);    % initialize delay buffer

d = .04*Fs; % 40 ms of delay
g = -0.7;   % Feed-back gain value

rate = 0.6; % Hz (frequency of LFO)
amp = 6; % Range of +,- 6 samples for delay

% Initialize Output Signal
N = length(in);
out = zeros(N,1);

for n = 1:N
    
    % uncomment to use fbcfNoMod.m function
    %[out(n,1),buffer] = fbcfNoMod(in(n,1),buffer,n,d,g);
    
    % Use fbcf.m function
    [out(n,1),buffer] = fbcf(in(n,1),buffer,Fs,n,...
        d,g,amp,rate);
    
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
