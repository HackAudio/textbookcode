% STEPDESIGNEXAMPLE
% This script demonstrates the stepDesign function
% for designing a second-order system with
% specified characteristics. The system is designed
% based on the percent overshoot, setttling time, 
% and peak time.
%
% See also STEPDESIGN
clc;clear;close all;

Fs = 48000;

% Example - filter design based on settling time
OS = 20;    % Percent overshoot
% Settling time in seconds
ts = .25;   % (within 2% of steady-state)
[b,a] = stepDesign(Fs,OS,ts,'st');
n = 1*Fs;  % number of seconds for step response
[h,t] = stepz(b,a,n,Fs);
plot(t,h);

figure;

% Example - filter design based on peak time
OS = 10;   % Percent overshoot
tp = 0.75; % Peak time in seconds
[b,a] = stepDesign(Fs,OS,tp,'pk');
n = 2*Fs; % number of seconds for step response
[h,t] = stepz(b,a,n,Fs);
plot(t,h);

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

