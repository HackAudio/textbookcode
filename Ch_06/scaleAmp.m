% SCALEAMP
% This script demonstrates two methods for 
% scaling the amplitude of a signal. The first
% method uses a loop to perform element-wise
% indexing of the input signal. The second method
% uses MATLAB's scalar operation with the array.

clear; clc;

% Import the input signal
filename = 'sw20Hz.wav';
[x,Fs] = audioread(filename); % input signal

Ts = 1/Fs;
% Time vector for plotting
t = [0:length(x)-1]*Ts; t = t(:);

% Example 1 - Loop
g1 = 0.5; % Gain Scalar

N = length(x);
y1 = zeros(N,1);
% n - variable for sample number
for n = 1:N
    % Multiply each element of "x" by "g1"
    y1(n,1) = g1 * x(n,1);
    
end

figure(1); % Plot Example 1
plot(t,x,'--',t,y1); legend('x','0.5*x');

% Example 2 - Array Operation
g2 = 0.25;

% In this approach, it is not necessary to use 
% a loop to index the individual elements of "x".
% By default, this operation performs element-wise processing
y2 = g2 * x;

figure(2);  % Plot Example 2
plot(t,x,t,y2);

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
