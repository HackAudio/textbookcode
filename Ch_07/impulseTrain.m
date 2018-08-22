% IMPULSETRAIN
% This script demonstrates a method to create 
% an Impulse Train signal. Initially, all values 
% of the signal are set to zero. Then, individual
% samples are changed to a value of 1 based on the
% length of a cycle's period.
clear;clc;

% Example - Impulse Train Signal
% 5 Hz signal for visualization
f = 5;
Fs = 20; Ts = (1/Fs); 
t = 0:Ts:1; t = t(:); % Time vector

impTrain = zeros(size(t)); % Initialize to all zeros
period = round(Fs/f); % # of samples/cycle
% Change the single sample at the start of a cycle to 1
impTrain(1:period:end) = 1;
stem(t,impTrain); axis([0 1 -0.1 1.1]); % Show stem plot

% Example - 440 Hz signal for audition
f = 440; 
Fs = 48000; Ts = (1/Fs);
t = 0:Ts:3; t = t(:);
it = zeros(size(t));
period = round(Fs/f); % # of samples/cycle
it(1:period:end) = 1;
sound(it,Fs);  % Listen to signal

% 50 Hz signal for spectrum plot
f = 50; 
Fs = 48000; Ts = (1/Fs);
t = 0:Ts:1; t = t(:);
it = zeros(size(t));
period = round(Fs/f); % # of samples/cycle
it(1:period:end) = 1;
plottf(it,Fs);   % Plot spectrum

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
