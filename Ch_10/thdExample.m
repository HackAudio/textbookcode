% THDEXAMPLE
% This script demonstrates how to analyze and 
% visualize total harmonic distortion (THD)
% for a non-linear function.
%
% See also DISTORTIONEXAMPLE

clear; clc;
Fs = 48000; Ts = 1/Fs; Nyq = Fs/2;
t = [0:Ts:1-Ts];
f = 2500;
% Input signal
x = sin(2*pi*f*t);
% Hypothetical distortion effect outputs a square wave
y = square(2*pi*f*t);

% Use THD function
thd(y,Fs); % Opens Plot
r = thd(y,Fs);  % Returns THD in dB

% Convert dB to percentage
percentTHD = 10^(r/20) * 100

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
