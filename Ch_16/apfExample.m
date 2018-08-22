% APFEXAMPLE
% This script uses an all-pass filter
% function, applied to an acoustic guitar recording. 
%
% See also APF
clear;clc;

[in,Fs] = audioread('AcGtr.wav');

maxDelay = max(ceil(.05*Fs));  % maximum delay of 50 ms
buffer = zeros(maxDelay,1); 

d = ceil(.042*Fs); % 42 ms of delay
g = 0.9;

rate = 0.9; % Hz (frequency of LFO)
amp = 6; % Range of +,- 6 samples for delay

% Initialize Output Signal
N = length(in);
out = zeros(N,1);

for n = 1:N
    
    % Use apf.m function
    [out(n,1),buffer] = apf(in(n,1),buffer,Fs,n,...
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
