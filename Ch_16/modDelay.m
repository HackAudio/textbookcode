% MODDELAY
% This function creates a series delay effect 
% using a buffer. The delay time can be modulated 
% based on the LFO parameters "depth" and "rate"
%
% Input Variables
%   in : single sample of the input signal
%   buffer : used to store delayed samples of the signal
%   n : current sample number used for the LFO
%   depth : range of modulation (samples)
%   rate : speed of modulation (frequency, Hz)

function [out,buffer] = modDelay(in,buffer,Fs,n,...
    delay,depth,rate)

% Calculate time in seconds for the current sample
t = (n-1)/Fs;
fracDelay = depth * sin(2*pi*rate*t);
intDelay = floor(fracDelay); 
frac = fracDelay - intDelay; 

% Determine indexes for circular buffer
len = length(buffer);
indexC = mod(n-1,len) + 1; % Current index 
indexD = mod(n-delay-1+intDelay,len) + 1; % Delay index
indexF = mod(n-delay-1+intDelay+1,len) + 1; % Fractional index


out = (1-frac) * buffer(indexD,1) + ...
    (frac) * buffer(indexF,1);

% Store the current output in appropriate index
buffer(indexC,1) = in;

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
