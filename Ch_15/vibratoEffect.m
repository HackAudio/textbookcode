% VIBRATOEFFECT
% This function implements a vibrato effect based
% on depth and rate LFO parameters.
%
% Input Variables
%   in : single sample of the input signal
%   buffer : used to store delayed samples of the signal
%   n : current sample number used for the LFO
%   depth : range of modulation (samples)
%   rate : speed of modulation (frequency, Hz)
%
% See also CHORUSEFFECT

function [out,buffer] = vibratoEffect(in,buffer,Fs,n,...
    depth,rate)

% Calculate lfo for current sample
t = (n-1)/Fs;
lfo = (depth/2) * sin(2*pi*rate*t) + depth; 

% Determine indexes for circular buffer
len = length(buffer);
indexC = mod(n-1,len) + 1; % Current index in circular buffer

fracDelay = mod(n-lfo-1,len) + 1; % Delay index in circular buffer
intDelay = floor(fracDelay);      % Fractional delay indices
frac = fracDelay - intDelay;

nextSamp = mod(intDelay,len) + 1;  % Next index in circular buffer


out = (1-frac) * buffer(intDelay,1) + ...
    (frac) * buffer(nextSamp,1);

% Store the current output in appropriate index
buffer(indexC,1) = in;