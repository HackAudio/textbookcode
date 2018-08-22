% LINEARFADE
% This script creates linear fades. Then,
% the "fade-in" is applied to the beginning of 
% a sine wave signal. The "fade-out" is applied
% to the end.
%
% See also EXPONENTIALFADE

clc;clear;close all;
Fs = 48000;
Ts = (1/Fs);
t = 0:Ts:3;
t = t(:);
f = 100; phi = 0;
in = sin(2*pi*f.*t + phi);
figure(1);
plot(t,in);
 
numOfSamples = 1*Fs; % 1 second fade in/out
a = linspace(0,1,numOfSamples); a = a(:);
fadeIn = a;
fadeOut = 1-a; % Equivalent = linspace(1,0,numOfSamples);
figure(2);
plot(a,fadeIn,a,fadeOut);legend('Fade-in','Fade-out');

% Fade-In
% Index samples just at the start of the signal
temp = in;
temp(1:numOfSamples) = fadeIn .* in(1:numOfSamples);
figure(3);
plot(t,temp);

% Fade-Out
% Index samples just at the end of the signal
out = temp; 
out(end-numOfSamples+1:end) = fadeOut.*temp(end-numOfSamples+1:end); 
figure(4);
plot(t,out);

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
