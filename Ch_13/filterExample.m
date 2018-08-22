% FILTEREXAMPLE
%
% This script demonstrates how to use a built-in, IIR
% filter design function to create the impulse response
% for a LPF. Then, the filtering is performed on an
% audio signal using the "filter" function.
%
% See also BUTTER, FILTER

% Import our audio file
[x,Fs] = audioread('AcGtr_1.wav');
Nyq = Fs/2;

m = 4; % Order of the Filter

freqHz = 500; % frequency in Hz
Wn = freqHz/Nyq;

[b,a] = butter(m,Wn);

y = filter(b,a,x);

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
