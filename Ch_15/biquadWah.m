% BIQUADWAH
% This function can be used to create a Wah-wah audio effect
%
% Input Variables
%   in : single sample of the input signal
%   Fs : sampling rate
%   lfo : used to determine the frequency of LPF
%   ff : buffer for feed-foward delay
%   fb : buffer for feed-back delay
%   wet : percent of processed signal (dry = 100 - wet)
%
% Use Table 13.1 to Caculate LPF Bi-quad Coefficients
%
% See all BIQUADPHASER

function [out,ff,fb] = biquadWah(in,Fs,...
        lfo,Q,ff,fb,wet)



% Convert value of LFO to normalized frequency
w0 = 2*pi*lfo/Fs;
% Normalize Bandwidth
alpha = sin(w0)/(2*Q);

b0 = (1-cos(w0))/2;    a0 = 1+alpha;
b1 = 1-cos(w0);        a1 = -2*cos(w0);
b2 = (1-cos(w0))/2;    a2 = 1-alpha;

% Wet/Dry Mix
mixPercent = wet;  % 0 = Only Dry, 100 = Only Wet
mix = mixPercent/100;
    
% Store Dry and Wet Signals
drySig = in; 

% Low-pass Filter
wetSig = (b0/a0)*in + (b1/a0)*ff(1,1) + ...
    (b2/a0)*ff(2,1) - (a1/a0)*fb(1,1) - (a2/a0)*fb(2,1);

% Blend Parallel Paths
out = (1-mix)*drySig + mix*wetSig;

% Iterate Buffers for Next Sample
ff(2,1) = ff(1,1);
ff(1,1) = in;
fb(2,1) = fb(1,1);
fb(1,1) = wetSig;
