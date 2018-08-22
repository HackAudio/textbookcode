% IMPZEXAMPLE
% This script demonstrates how to use a built-in function
% "impz" to approximate an IIR system as an FIR system.
% Then, filtering is performed on an audio
% signal using the convolution operation.
%
% See also IMPZ, CONV, BUTTER

% Import our audio file
[x,Fs] = audioread('AcGtr_1.wav');
Nyq = Fs/2;

m = 4; % Order of the Filter

freqHz = 2000; % frequency in Hz
Wn = freqHz/Nyq;

[b,a] = butter(m,Wn);

h = impz(b,a); % Approximate System

y = conv(x,h);

sound(y,Fs); % Listen to the effect

stem(h);

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
