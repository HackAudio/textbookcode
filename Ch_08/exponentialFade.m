% EXPONENTIALFADE
% This script creates exponential fades. Both
% convex and concave examples are provided.
% These fades are applied to the beginning and end
% of a sine wave test signal.
%
% See also LINEARFADE

clear;clc;close all;
Fs = 48000;
Ts = (1/Fs);
t = 0:Ts:3;
t = t(:);
f = 100; phi = 0;
in = sin(2*pi*f.*t + phi);
figure(1);
plot(t,in);

% Convex Fades 
numOfSamples = 1*Fs; % 1 second fade in/out

% Exponent for curve
x = 2; % "x" can be any number > 1 (linear  = 1)

a = linspace(0,1,numOfSamples); a = a(:);
fadeOut = 1 - a.^x;

a = linspace(1,0,numOfSamples); a = a(:);
fadeIn = 1 - a.^x;

figure(2);
plot(a,fadeIn,a,fadeOut);legend('Fade In','Fade Out');

% Fade In
temp = in;
temp(1:numOfSamples) = fadeIn .* in(1:numOfSamples); 
figure(3);
plot(t,temp);

% Fade Out
out = temp;
out(end-numOfSamples+1:end) = fadeOut.*temp(end-numOfSamples+1:end);
figure(4);
plot(t,out);

% (Alternate) Concave Fades 
a = linspace(0,1,numOfSamples); a = a(:);
fadeOut = a.^x;
a = linspace(1,0,numOfSamples); a = a(:);
fadeIn = a.^x;
figure(5);
plot(a,fadeIn,a,fadeOut);legend('Fade-in','Fade-out');

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
