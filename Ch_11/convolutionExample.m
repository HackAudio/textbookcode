% convolutionExample.m
% This script demonstrates the MATLAB Convolution
% function - 'y = conv(x,h)'
% The example demonstrated is with a single cycle of a 
% sine wave. When the sine wave is convolved with the
% impulse response for an echo effect, the output
% signal has delayed copies of the sine wave at 
% different amplitudes at different times.
%
% See also CONV

clear; clc; close all;
% Import Previously Saved IR
[h,Fs] = audioread('impResp.wav');

% Synthesize input signal
x = zeros(2*Fs,1); % 2 second long input signal
f = 4;
t = [0:Fs*0.25 - 1]/Fs;
x(1:Fs*0.25) = sin(2*pi*f*t);

% Perform Convolution
y = conv(x,h);

% Plot Signals
xAxis = (0:length(h)-1)/Fs;
subplot(3,1,1);
plot(xAxis,x); % Plot the Impulse Response
axis([-0.1 2 -1.1 1.1]);
xlabel('Time (sec.)');
title('Input Signal - x[n]');

subplot(3,1,2);
stem(xAxis,h); % Plot the Impulse Response
axis([-0.1 2 -0.1 1.1]);
xlabel('Time (sec.)');
title('Impulse Response - h[n]');

subplot(3,1,3);
plot(xAxis,y(1:2*Fs)); % Plot the Impulse Response
axis([-0.1 2 -1.1 1.1]);
xlabel('Time (sec.)');
title('Output Signal - y[n]');

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
