% FEEDBACKFLANGER
% This function can be used to create a feed-back flanger
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
% See also FLANGEREFFECT

function [out,buffer] = feedbackFlanger(in,buffer,Fs,n,...
    depth,rate,predelay,wet)

% Calculate time in seconds for the current sample
t = (n-1)/Fs;
lfo = depth * sin(2*pi*rate*t) + predelay;

% Wet/Dry Mix
mixPercent = wet;  % 0 = Only Dry, 100 = Only Feedback
mix = mixPercent/100;

fracDelay = lfo; 
intDelay = floor(fracDelay); 
frac = fracDelay - intDelay; 
    
% Store Dry and Wet Signals
drySig = in; 
wetSig = (1-frac)*buffer(intDelay,1) + (frac)*buffer(intDelay+1,1);

% Blend Parallel Paths
out = (1-mix)*drySig + mix*wetSig;

% Feedback is created by storing the output in the 
% buffer instead of the input
buffer = [out ; buffer(1:end-1,1)]; 