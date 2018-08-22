% APF
% This function creates an all-pass filter by 
% processing an individual input sample and updating 
% a delay buffer used in a loop to index each sample
% in a signal.
%
% Input Variables
%   n : current sample number of the input signal
%   delay : samples of delay
%   gain : feed-back gain (linear scale)
%   amp : amplitude of LFO modulation
%   rate : frequency of LFO modulation

function [out,buffer] = apf(in,buffer,Fs,n,delay,gain,amp,rate)

% Calculate time in seconds for the current sample
t = (n-1)/Fs;
fracDelay = amp * sin(2*pi*rate*t);
intDelay = floor(fracDelay); 
frac = fracDelay - intDelay; 

% Determine indexes for circular buffer
len = length(buffer);
indexC = mod(n-1,len) + 1; % Current index 
indexD = mod(n-delay-1+intDelay,len) + 1; % Delay index
indexF = mod(n-delay-1+intDelay+1,len) + 1; % Fractional index

% Temp variable for output of delay buffer
w = (1-frac)*buffer(indexD,1) + (frac)*buffer(indexF,1);

% Temp variable used for the node after the input sum
v = in + (-gain*w);

% Summation at output
out = (gain * v) + w;

% Store the current input to delay buffer
buffer(indexC,1) = v;

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
