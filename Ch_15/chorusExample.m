% CHORUSEXAMPLE
% This script creates a chorus effect, applied to an acoustic
% guitar recording. 
%
% See also CHORUSEFFECT
clear;clc;

[in,Fs] = audioread('AcGtr.wav');

maxDelay = ceil(.05*Fs);  % maximum delay of 50 ms
buffer = zeros(maxDelay,1); 

rate = 0.6; % Hz (frequency of LFO)
depth = 5; % Milliseconds (amplitude of LFO)
predelay = 30; % Milliseconds (offset of LFO)

wet = 50; % Percent Wet (Dry = 100 - Wet)

% Initialize Output Signal
N = length(in);
out = zeros(N,1);

for n = 1:N
    
    % Use chorusEffect.m function
    [out(n,1),buffer] = chorusEffect(in(n,1),buffer,Fs,n,...
        depth,rate,predelay,wet);
    
end

sound(out,Fs);