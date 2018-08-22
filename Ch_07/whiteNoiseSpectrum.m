% WHITENOISESPECTRUM
% This script shows the waveform and frequency spectrum
% plots for white noise
%
% See also PLOTTF

clear; clc; close all;
% Example - White Noise
% Declare initial parameters
Fs = 48000;
lenSec = 1; % 1 second long signal
N = Fs*lenSec;  % Convert to time samples
noise = 0.2*randn(N,1);
plottf(noise,Fs);

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
