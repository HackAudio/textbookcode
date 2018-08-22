% convolutionFiltering.m
%
% This script demonstrates how to use a built-in, FIR
% filter design function to create the impulse response
% for a LPF. Then, the filtering is performed on an
% audio signal using the convolution operation.


% Import our audio file
[x,Fs] = audioread('AcGtr.wav');
Nyq = Fs/2;

n = 30; % Order of the Filter

freqHz = 500; % frequency in Hz
Wn = freqHz/Nyq; % Normalized frequency for fir1

[ h ] = fir1(n,Wn);  % Filter design function

% "h" is the impulse response of the filter

% Convolution applies the filter to a signal
y = conv(x,h);  

sound(y,Fs); % Listen to the effect

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
