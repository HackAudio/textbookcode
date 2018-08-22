% PINKNOISE2
% This script synthesizes an approximation of pink noise
% using an IIR filter.
%
% Pink noise can be created by filtering white noise. The
% amplitude response of the filter decreases by 10 dB/decade
% or ~3 dB/octave.

clc; clear; close all;
Fs = 48000;     % Sampling rate
Nyq = Fs/2;     % Nyquist Frequency for Normalization
sec = 5;        % 5 seconds of noise
white = randn(sec*Fs,1);

% IIR Coefficients
b = [0.049922035, -0.095993537, 0.050612699, -0.004408786];
a = [1 -2.494956002   2.017265875  -0.522189400];
[H,F] = freqz(b,a,4096,Fs);
semilogx(F,20*log10(abs(H))); axis([20 20000 -30 0]);

% Create Pink Noise by Filtering White Noise
pink = filter(b,a,white);
sound(pink,Fs);

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
