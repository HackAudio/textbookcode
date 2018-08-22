% ELEMENTLOOP
% This script demonstrates a method to reference
% and assign the elements of an input array to an 
% output array
%
% A loop is used to step through each element of
% the arrays

clear; clc;
% Example - Sine wave test signal
filename = 'sw20Hz.wav';
[x,Fs] = audioread(filename); % input signal

N = length(x);
y = zeros(N,1);    
% Loop through arrays to perform element-wise referencing
% n - variable for sample number
for n = 1:N
    % Note: a new element from 'x' is assigned to 'y'
    % each time through the loop
    y(n,1) = x(n,1)
    
end

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


