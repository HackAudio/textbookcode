% FBCFNOMOD
% This function creates a feed-back comb filter by 
% processing an individual input sample and updating 
% a delay buffer used in a loop to index each sample
% in a signal. This implementation does not use
% fractional delay. Therefore, the delay time
% cannot be modulated.
%
% Input Variables
%   n : current sample number of the input signal
%   delay : samples of delay
%   fbGain : feed-back gain (linear scale)
%
% See also FBCF

function [out,buffer] = fbcfNoMod(in,buffer,n,delay,fbGain)

% Determine indexes for circular buffer
len = length(buffer);
indexC = mod(n-1,len) + 1; % Current index 
indexD = mod(n-delay-1,len) + 1; % Delay index

out = buffer(indexD,1);

% Store the current output in appropriate index
buffer(indexC,1) = in + fbGain*buffer(indexD,1);

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

