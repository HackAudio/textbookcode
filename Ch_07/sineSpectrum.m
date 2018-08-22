% SINESPECTRUM
% This script shows the waveform and frequency spectrum
% plots for a sine wave
%
% See also PLOTTF, SINESYNTHESIS

clear; clc; close all;
% Example - Sine Wave Signal
% Declare initial parameters
f = 50; % Frequency in Hz
Fs = 48000; Ts = 1/Fs;
lenSec = 1; % 1 second long signal
N = Fs*lenSec;  % Convert to time samples
x = zeros(N,1);
% Loop to perform element-wise referencing
for n = 1:N
    t = (n-1) * Ts;   % 't' is a scalar
    x(n,1) = sin(2*pi*f*t); 
end

% Plot Waveform and Frequency Spectrum
plottf(x,Fs);

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

