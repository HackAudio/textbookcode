% TRIANGLESYNTHESIS
% This script demonstrates a method
% to transform the 'sawtooth' function to
% a triangle wave
%
% See also SINESYNTHESIS, SAWTOOTHSYNTHESIS, SQUARESYNTHESIS

clear;clc;
% Example - Triangle Wave Signal
% 4 Hz signal for visualization
f = 4; phi = 0; Fs = 40;
Ts = 1/Fs;
t = [0:Ts:1].'; % Time vector in seconds

% Triangle wave => peak occurs at half (0.5) of cycle length
triangleWave = sawtooth(2*pi*f.*t + phi,0.5);
plot(t,triangleWave);                 

% Sawtooth with peak at beginning of cycle, then decreasing amp
sawtoothWave = sawtooth(2*pi*f.*t + phi,0);
plot(t,sawtoothWave);

% Sawtooth with increasing amp during cycle, peak at end 
sawtoothWave = sawtooth(2*pi*f.*t + phi,1);
plot(t,sawtoothWave);

% 880 Hz signal for audition
Fs = 44100; Ts = (1/Fs);
t = 0:Ts:3; t = t(:);
f = 880; % Frequency in Hz

tr = sawtooth(2*pi*f.*t,0.5); % Triangle
sound(tr,Fs);

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
