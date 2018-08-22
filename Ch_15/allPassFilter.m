% ALLPASSFILTER
% This script demonstrates an implementation of an
% all-pass filter using a delay buffer (Direct Form II)

clear;clc;
in = [1; zeros(100,1)];

buffer = zeros(5,1); % Longer buffer than delay length

% Number of samples of delay 
delay = 2; % Does not need to be the same length as buffer

g = 0.5;

N = length(in);
out = zeros(N,1);
% Series Delay
for n = 1:N
    
    % Series All-pass Filters
    out(n,1) = g*in(n,1) + buffer(delay,1);
    buffer = [in(n,1) + -g*out(n,1) ; buffer(1:end-1,1)];
    
end

freqz(out);