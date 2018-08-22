% BITREDUCT
% This function creates a bit reduction or
% bit crushing distortion. It uses an input
% variable, "nBits", to determine the number of 
% amplitude values in the output signal. This 
% algorithm can have a fractional number of bits,
% similar to the processing found in some audio plug-ins.
%
% Input variables
%   inputSignal : array of samples for the input signal
%   nBits : scalar for the number of desired bits
%
% See also DISTORTIONEXAMPLE, ROUND, CEIL, FLOOR, FIX

function [out] = bitReduct(in,nBits)

% Determine the desired number of possible amplitude values
ampValues = 2 ^ nBits;

% Shrink the full-scale signal (-1 to 1, peak-to-peak)
% to fit within a range of 0 to 1
prepInput = 0.5*in + 0.5;

% Scale the signal to fit within the range of the possible values
scaleInput = ampValues * prepInput;

% Round the signal to the nearest integers
roundInput = round(scaleInput);

% Invert the scaling to fit the original range
prepOut = roundInput / ampValues;

% Fit in full-scale range 
out = 2*prepOut - 1;

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

