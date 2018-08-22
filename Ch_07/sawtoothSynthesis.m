% SAWTOOTHSYNTHESIS
% This script demonstrates the 'sawtooth' function
%
% See also SINESYNTHESIS, SQUARESYNTHESIS, TRIANGLESYNTHESIS

clear;clc;
% Example - Sawtooth Wave Signal
% 4 Hz signal for visualization
f = 4;
phi = 0;
Fs = 40;
Ts = (1/Fs);
t = [0:Ts:1].';
sawtoothWave = sawtooth(2*pi*f.*t + phi);
plot(t,sawtoothWave);

% 880 Hz signal for audition
Fs = 44100;
Ts = (1/Fs);
t = 0:Ts:3;
t = t(:);
f = 880;
st = sawtooth(2*pi*f.*t); 
sound(st,Fs);

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
