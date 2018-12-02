% AUTOPANEXAMPLE
% This script implements the Automatic Panning (auto-pan)
% effect. The function "pan" is used to process an
% input signal, along with an array of pan values
% for each sample number in the signal
%
% See also PAN
clc; clear;

% Import test sound file
[in,Fs] = audioread('RhythmGuitar.wav'); 
N = length(in); Ts = 1/Fs;
% Create time vector t of samples for LFO
t = [0:N-1]*Ts; t = t(:);
f = 1; % Frequency of panning LFO

% Generate sine wave LFO based on f and t
panValue = 100*sin(2*pi*f*t);
panType = 2; % Start with panType = 2, but try 1,2,3

% Run pan function
[out] = pan(in,panValue,panType);

sound(out,Fs);

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
