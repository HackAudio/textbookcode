% COMPRESSOREXAMPLE
% This script creates a dynamic range compressor with
% separate attack and release times 
% 
% See also COMPRESSOR, BASICCOMP

% Acoustic Guitar "Audio" Sound file
[in,Fs] = audioread('AcGtr.wav');

% Parameters for Compressor
T = -15;   % Threshold = -15 dBFS
R = 10;     % Ratio = 10:1

% Initialize separate attack and release times
attackTime = 0.05;  % time in seconds
releaseTime = 0.25;  % time in seconds

% Compressor Function
out = compressor(in,Fs,T,R,attackTime,releaseTime);
sound(out,Fs);


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



