% EXPANDEREXAMPLE
% This script demonstrates an expander/gate DR processor
%
% See also EXPANDER, COMPRESSOREXAMPLE
clear; clc; close all;

% Drums Sound file
[in,Fs] = audioread('monoDrums.wav');

% Parameters for Compressor
T = -20;   % Threshold = -20 dBFS
R = 3;     % Ratio = 3:1

% Initialize separate attack and release times
attackTime = 0.005;  % time in seconds
releaseTime = 0.4;  % time in seconds

out = expander(in,Fs,T,R,attackTime,releaseTime);
sound(out,Fs);
% sound(in,Fs); % For comparison

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
