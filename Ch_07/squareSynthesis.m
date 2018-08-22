% SQUARESYNTHESIS
% This script demonstrates the 'square' function
%
% See also SINESYNTHESIS, SAWTOOTHSYNTHESIS, TRIANGLESYNTHESIS

clear;clc;
% Example - Square Wave Signal
% 2 Hz square wave for visualization
f = 2; 
phi = 0;
Fs = 1000;
Ts = (1/Fs);
t = [0:Ts:1].';
squareWave = square(2*pi*f.*t + phi);
plot(t,squareWave); axis([0 1 -1.1 1.1]);
xlabel('Time (sec.)');ylabel('Amplitude');
legend('2 Hz');

% 880 Hz square wave for audition
Fs = 44100;
Ts = (1/Fs);
t = 0:Ts:3; t = t(:);
f = 880;
sq = square(2*pi*f.*t);
sound(sq,Fs);

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
