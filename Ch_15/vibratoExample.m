% VIBRATOEXAMPLE
% This script creates a vibrato effect, applied to an acoustic
% guitar recording. Parameters for the effect include "rate"
% and "depth" which can be used to control the intensity
% of the vibrato. At the end of the script, the sound of
% the result is played.
%
% See also VIBRATOEFFECT
clear;clc;

[in,Fs] = audioread('AcGtr.wav'); % Input signal
Ts = 1/Fs;
N = length(in);

% Initialize the delay buffer
maxDelay = 1000; % Samples
buffer = zeros(maxDelay,1); 

% LFO parameters
t = [0:N-1]*Ts; t = t(:);
rate = 4; % Frequency of LFO in Hz
depth = 75; % Range of samples of delay

% Initialize Output Signal
out = zeros(N,1);

for n = 1:N
    
   [out(n,1),buffer] = vibratoEffect(in(n,1),buffer,Fs,n,...
    depth,rate);
    
end

sound(out,Fs);