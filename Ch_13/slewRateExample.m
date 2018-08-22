% SLEWRATEEXAMPLE
% This script demonstrates how to use the 
% slewRateDistortion function. Two examples are
% provided, with a sine wave and with a square wave.
%
% See also SLEWRATEDISTORTION

% Initial Parameters
Fs = 48000; Ts = 1/Fs;
f = 5;   % Low frequency for sake of plotting
t = [0:Ts:1].';

x = sin(2*pi*f*t);    % Example 1: Sine Wave
%x = square(2*pi*f*t); % Example 2: Square Wave

maxFreq = 3;  % 
% Note: if maxFreq >= "f" of sine wave, then no distortion
% If maxFreq < "f" of input, then slew rate distortion
y = slewRateDistortion(x,Fs,maxFreq);

plot(t,x);hold on;
plot(t,y);hold off; axis([0 1 -1.1 1.1]);
legend('Input','Output');

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
