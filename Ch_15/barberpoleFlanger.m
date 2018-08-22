% BARBERPOLEFLANGER
% This function can be used to create a barber-pole flanger
%
% Input Variables
%   in : single sample of the input signal
%   buffer : used to store delayed samples of the signal
%   n : current sample number used for the LFO
%   depth : range of modulation (samples)
%   rate : speed of modulation (frequency, Hz)
%   predelay : offset of modulation (samples)
%   wet : percent of processed signal (dry = 100 - wet)
%
% See also FLANGEREFFECT, FEEDBACKFLANGER, BARBERPOLEFLANGER2

function [out,buffer,lfo] = barberpoleFlanger(in,buffer,Fs,n,...
    depth,rate,predelay,wet)

% Calculate time in seconds for the current sample
t = (n-1)/Fs;
lfo = depth * sawtooth(2*pi*rate*t,0) + predelay;

% Wet/Dry Mix
mixPercent = wet;  % 0 = Only Dry, 100 = Only Feed-back
mix = mixPercent/100;

fracDelay = lfo; 
intDelay = floor(fracDelay); 
frac = fracDelay - intDelay; 
    
% Store Dry and Wet Signals
drySig = in; 
wetSig = (1-frac)*buffer(intDelay,1) + (frac)*buffer(intDelay+1,1);

% Blend Parallel Paths
out = (1-mix)*drySig + mix*wetSig;

% Feed-back is created by storing the output in the 
% buffer instead of the input

buffer = [in ; buffer(1:end-1,1)]; 