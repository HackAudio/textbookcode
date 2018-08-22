% MIDSIDEPROCESSING
% This script performs mid-side (sum and difference)
% encoding and decoding. 
clc; clear;

[input,Fs] = audioread('stereoDrums.wav');

% Separate stereo signal into two mono signals
left = input(:,1);
right = input(:,2);

% Mid-side Encoding
mid = 0.5 * (left + right);
sides = 0.5 * (left - right);

% Add additional processing here 
% (e.g. distortion, compression, etc.)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Mid-side Decoding
newL = mid + sides;
newR = mid - sides;

output = [newL , newR];

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

