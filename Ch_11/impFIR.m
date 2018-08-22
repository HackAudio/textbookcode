% IMPFIR
% This script demonstrates one example to measure
% the impulse response of an FIR system 
%
% See also IMPIIR

clear;clc;close all;
Fs = 48000;
N = Fs*2;
% Synthesize the impulse signal
imp = zeros(N,1); % 2 second long signal of 0's
imp(1,1) = 1;  % Change the first sample = 1

d1 = 0.5*Fs;  % 1/2 second delay
b1 = 0.7; % Gain of first delay line

d2 = 1.5*Fs;  % 3/2 second delay
b2 = 0.5;     % Gain of second delay line

% Zero-pad the beginning of the signal for indexing
% based on the maximum delay time
pad = zeros(d2,1);
impPad = [pad;imp];

out = zeros(N,1);
% Index each element of our signal to create the output
for n = 1:N
    index= n+d2;
    out(n,1) = impPad(index,1) ...
        + b1*impPad(index-d1,1) + b2*impPad(index-d2,1);
end

t = [0:N-1]/Fs;
subplot(1,2,1);
stem(t,imp); % Plot the Impulse Response
axis([-0.1 2 -0.1 1.1]);
xlabel('Time (sec.)');
title('Input Impulse');
subplot(1,2,2);
stem(t,out); % Plot the Impulse Response
axis([-0.1 2 -0.1 1.1]);
xlabel('Time (sec.)');
title('Output Impulse Response');

% Save the Impulse Response for Future Use
audiowrite('impResp.wav',out,Fs);

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
