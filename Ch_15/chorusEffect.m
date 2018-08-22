% CHORUSEFFECT
% This function can be used to create a Chorus audio effect
%
% Input Variables
%   in : single sample of the input signal
%   buffer : used to store delayed samples of the signal
%   n : current sample number used for the LFO
%   depth : range of modulation (milliseconds)
%   rate : speed of modulation (frequency, Hz)
%   predelay : offset of modulation (milliseconds)
%   wet : percent of processed signal (dry = 100 - wet)
%
% See also VIBRATOEFFECT, FLANGEREFFECT

function [out,buffer] = chorusEffect(in,buffer,Fs,n,...
    depth,rate,predelay,wet)

% Calculate time in seconds for the current sample
t = (n-1)/Fs;
lfoMS = depth * sin(2*pi*rate*t) + predelay;
lfoSamples = (lfoMS/1000)*Fs;

% Wet/Dry Mix
mixPercent = wet;  % 0 = Only Dry, 100 = Only Wet
mix = mixPercent/100;

fracDelay = lfoSamples; 
intDelay = floor(fracDelay); 
frac = fracDelay - intDelay; 
    
% Store Dry and Wet Signals
drySig = in; 
wetSig = (1-frac)*buffer(intDelay,1) + (frac)*buffer(intDelay+1,1);

% Blend Parallel Paths
out = (1-mix)*drySig + mix*wetSig;

% Linear Buffer Implemented
buffer = [in ; buffer(1:end-1,1)]; 
