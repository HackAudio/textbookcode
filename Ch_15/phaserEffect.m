% PHASEREFFECT
% This function can be used to create a Phaser audio effect
%
% Input Variables
%   in : single sample of the input signal
%   buffer : used to store delayed samples of the signal
%   n : current sample number used for the LFO
%   depth : range of modulation (samples)
%   rate : speed of modulation (frequency, Hz)
%   wet : percent of processed signal (dry = 100 - wet)
%
% See also BIQUADPHASER

function [out,buffer] = phaserEffect(in,buffer,Fs,n,...
    depth,rate,wet)

% Calculate time in seconds for the current sample
t = (n-1)/Fs;
lfo = depth * sin(2*pi*rate*t)+2;

% Wet/Dry Mix
mixPercent = wet;  % 0 = Only Dry, 100 = Only Wet
mix = mixPercent/100;

fracDelay = lfo; 
intDelay = floor(fracDelay); 
frac = fracDelay - intDelay; 
    
% Store Dry and Wet Signals
drySig = in; 

g = 0.25;
% All-pass Filter
wetSig = g*in + ((1-frac)*buffer(intDelay,1) + ...
    frac*buffer(intDelay+1,1));

% Blend Parallel Paths
out = (1-mix)*drySig + mix*wetSig;

buffer = [in + -g*wetSig ; buffer(1:end-1,1)];