% DCOFFSET
% This script demonstrates a method to perform
% element-wise scalar addition, the equivalent
% of a DC offset

clear;clc;close all;

% Example - Sine Wave Signal
filename = 'sw20Hz.wav';
[in,Fs] = audioread(filename); % Import Sound File
Ts = 1/Fs;
% Assign in to out1, for comparison purposes
out1 = in;

N = length(in);
out2 = zeros(N,1); % Initialize output array
% Loop through arrays to perform element-wise scalar addition
for n = 1:N
    out2(n,1) = in(n,1)+1;
end

% Element-wise addition can also be 
% accomplished by adding a scalar directly to an array
out3 = in-0.5;

figure; % Create a new figure window
% Plot the output amplitude vs. time
t = [0:N-1]*Ts; t = t(:);
plot(t,out1,t,out2,t,out3);
xlabel('Time (sec.)');
ylabel('Amplitude');
legend('out1 = in','out2 = in+1','out3 = in-0.5');

figure;
% Plot the Input vs. Output
plot(in,out1,in,out2,in,out3);
xlabel('Input Amplitude');
ylabel('Output Amplitude');
legend('out1 = in','out2 = in+1','out3 = in-0.5');
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
