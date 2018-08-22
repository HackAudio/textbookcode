% CHARACTERISTICCURVE
% This script provides two examples for analyzing the 
% characteristic curve of an audio effect which uses 
% element-wise processing
%
% This first example creates an input array with values 
% from -1 to 1. The second example uses a sine wave signal

clear;clc;close all;

% Example 1: Array [-1 to 1] to span entire full-scale range
in = [-1:.1:1].';

% Example 2: Sine Wave Test Signal. This example shows the
% characteristic curve can be created using any signal
% which spans the full-scale range, even if it is periodic.
% Uncomment this code to switch examples.
%[in,Fs] = audioread('sw20Hz.wav');

% Assign in to out1, for comparison purposes
out1 = in;   % No amplitude change

N = length(in);
out2 = zeros(N,1);
% Loop through arrays to perform element-wise multiplication
for n = 1:N
    out2(n,1) = 2*in(n,1);
end

% Element-wise multiplication can also be 
% accomplished by multiplying an array directly by a scalar
out3 = 3*in;

% Plot the Characteristic Curve (In vs. Out)
plot(in,out1,in,out2,in,out3);
xlabel('Input Amplitude');
ylabel('Output Amplitude');
legend('out1 = in','out2 = 2*in','out3 = 3*in');
% Draw axes through origin
ax = gca;
ax.XAxisLocation = 'origin';
ax.YAxisLocation = 'origin';

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
