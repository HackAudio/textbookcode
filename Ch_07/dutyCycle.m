% DUTYCYCLE
% This script synthesizes a square wave
% with an asymmetrical duty cycle
%
% See also SQUARESYNTHESIS
clear;clc;
% Example - Duty Cycle = 25
Fs = 1000;
Ts = (1/Fs);
t = 0:Ts:1;
t = t(:);
f = 3;
duty = 25;
sq = square(2*pi*f.*t, duty); 
plot(t,sq); axis([0 1 -1.1 1.1]);
xlabel('Time (sec.)');ylabel('Amplitude');

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

