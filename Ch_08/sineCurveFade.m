% SINECURVEFADE
% This script demonstrates one approach to creating
% s-curve fades. This method involves using
% the sine function.
%
% See also LINEARFADE, EXPONENTIALFADE, SCURVEFADE

clear;clc;

Fs = 44100; % Arbitrary Sampling Rate
Ts = 1/Fs;
% S-Curve Fade In 
lenSec = 1; % 1 second fade in/out
N = round(lenSec * Fs);   % Convert to whole # of samples
t = [0:N-1]*Ts; t = t(:);

% The s-curve fade is half a cycle of a sine wave
% If fade is 1 sec., period of sine wave is 2 sec.
period = 2 * N * Ts;  % units of seconds
freq = 1/period;      % units of Hz
fadeIn = 0.5*sin(2*pi*freq*t - pi/2) + 0.5;

% S-Curve Fade Out 
fadeOut = 0.5*sin(2*pi*freq*t + pi/2) + 0.5;

% Plot the S-Curves
plot(t,fadeIn,t,fadeOut); legend('Fade-in','Fade-out');

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
