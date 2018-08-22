% BARBERPOLEFLANGER2
% This function can be used to create a barber-pole flanger.
% Specifically, the function is meant to crossfade between two
% flangers so that the rising flanger has a smooth transition
% at the start of each sawtooth ramp.
%
% Input Variables
%   in : single sample of the input signal
%   buffer : used to store delayed samples of the signal
%   n : current sample number used for the LFO
%   depth : range of modulation (samples)
%   rate : speed of modulation (frequency, Hz)
%   predelay : offset of modulation (samples)
%   wet : percent of processed signal (dry = 100 - wet)
%   g1 : amplitude of the first flanger in the crossfade
%   g2 : amplitude of the second flanger in the crossfade
%
% See also BARBERPOLEFLANGER

function [out,buffer,lfo1,lfo2] = barberpoleFlanger2(in,buffer,...
    Fs,n,depth,rate,predelay,wet,g1,g2)

% Calculate time in seconds for the current sample
t = (n-1)/Fs;
% Rate/2 because alternating, overlapping LFOs
lfo1 = depth * sawtooth(2*pi*rate/2*t + pi/6,0); 
% Hard-clipping at a negative value creates overlap
if lfo1 < -1
    lfo1 = -1;
end
lfo1 = lfo1 + predelay - 2;
lfo2 = depth * sawtooth(2*pi*rate/2*t + 7*pi/6,0); 
if lfo2 < -1
    lfo2 = -1;
end

lfo2 = lfo2 + predelay - 2;

% Wet/Dry Mix
mixPercent = wet;  % 0 = Only Dry, 100 = Only Feed-back
mix = mixPercent/100;

fracDelay1 = lfo1; 
intDelay1 = floor(fracDelay1); 
frac1 = fracDelay1 - intDelay1; 

fracDelay2 = lfo2; 
intDelay2 = floor(fracDelay2); 
frac2 = fracDelay2 - intDelay2;

% Store Dry and Wet Signals
drySig = in; 
wetSig = g1 * ((1-frac1)*buffer(intDelay1,1) + ...
    (frac1)*buffer(intDelay1+1,1)) ...
    + g2 * ((1-frac2)*buffer(intDelay2,1) + ...
    (frac2)*buffer(intDelay2+1,1));

% Blend Parallel Paths
out = (1-mix)*drySig + mix*wetSig;

% Feed-back is created by storing the output in the 
% buffer instead of the input

buffer = [in ; buffer(1:end-1,1)]; 