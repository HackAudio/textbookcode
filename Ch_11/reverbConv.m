% REVERBCONV
% This script demonstrates the process to create 
% a stereo convolution reverb by using a two-channel
% impulse response. This impulse response is based 
% on a measurement of a recording studio 
% in Nashville, Tennessee.

clear;clc;close all;

% Import sound file and IR measurement
[x,Fs] = audioread('AcGtr.wav'); % Mono signal
[h] = audioread('reverbIR.wav'); % Stereo IR

% Visualize one channel of the impulse response
plot(h(:,1));

% Perform Convolution
yLeft = conv(x,h(:,1));
yRight = conv(x,h(:,2));

y = [yLeft,yRight];

sound(y,Fs);

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
