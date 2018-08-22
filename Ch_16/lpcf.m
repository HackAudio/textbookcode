% LPCF
% This function creates a feed-back comb filter 
% with a LPF in the feed-back path.
%
% Input Variables
%   n : current sample number of the input signal
%   delay : samples of delay
%   fbGain : feed-back gain (linear scale)
%   amp : amplitude of LFO modulation
%   rate : frequency of LFO modulation
%   fbLPF : output delayed one sample to create basic LPF
%
% See also MOORERREVERB

function [out,buffer,fbLPF] = lpcf(in,buffer,Fs,n,delay,...
    fbGain,amp,rate,fbLPF)

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

out = (1-frac)*buffer(indexD,1) + (frac)*buffer(indexF,1);

% Store the current output in appropriate index
% The LPF is created by adding the current output
% with the previous sample, both are weighted 0.5
buffer(indexC,1) = in + fbGain*(0.5*out + 0.5*fbLPF);

% Store the current output for the Feed-back LPF 
% to be used with the next sample
fbLPF = out;

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

