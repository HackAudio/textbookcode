% RINGMODULATION
%
% This script demonstrates the result of performing 
% ring modulation with two different frequencies.
%
% By multiplying 300 Hz with 100 Hz, the result
% is a signal with two harmonics: 
% 200 Hz (300 - 100) and 400 Hz (300 + 100)

clc; clear;
% Initial Parameters
Fs = 48000; Ts = 1/Fs;
lenSec = 2;
N = lenSec * Fs;
fHigh = 300;
fLow = 100;

% Synthesize signals and perform element-wise multiplication
x = zeros(N,1);
for n = 1:N
   t = (n-1) * Ts;
   x(n,1) = sin(2*pi*fLow*t) * sin(2*pi*fHigh*t); 
end

plottf(x,Fs);

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

    