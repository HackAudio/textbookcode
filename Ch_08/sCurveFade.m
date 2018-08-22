% SCURVEFADE
% This script demonstrates one approach to creating
% s-curve fades. This method involves concatenating
% a convex fade with a concave fade.
%
% See also LINEARFADE, EXPONENTIALFADE, SINECURVEFADE

clear;clc;

Fs = 44100; % Arbitrary Sampling Rate

% S-Curve Fade In 
numOfSamples = round(1*Fs); % 1 sec. fade, round to whole sample
a = linspace(0,1,numOfSamples/2); a = a(:);
x = 2; % x can be any number >= 1
concave = 0.5*(a).^x;
convex = 0.5*(1 - (1-a).^x)+0.5;
fadeIn = [concave ; convex];

% S-Curve Fade Out 
x = 3; % x can be any number >= 1
convex = 0.5*(1 - a.^x)+0.5;
concave = 0.5*(1-a).^x;
fadeOut = [convex ; concave];

% Plot the S-Curves
t = linspace(0,1,numOfSamples); t=t(:);
plot(t,fadeIn,t,fadeOut); legend('Fade-in','Fade-out');

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
