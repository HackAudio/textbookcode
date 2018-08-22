% IMPFIR
% This script demonstrates one example to approximate
% the impulse response of an IIR system 
%
% See also IMPFIR

clear;clc;close all;
Fs = 48000; Ts = 1/Fs;
N = Fs*2;   % Number of samples
% Synthesize the impulse signal
imp = zeros(N,1); % 2 second long signal of 0's
imp(1,1) = 1;  % Change the first sample = 1

d1 = 0.5*Fs;  % 1/2 second delay
a1 = -0.7; % Gain of feed-back delay line

% Index each element of our signal to create the output
for n = 1:d1
    out(n,1) = imp(n,1); % Initially there is no delay
end
for n = d1+1:Fs*2        % Then there is signal + delay
    out(n,1) = imp(n,1) + a1*out(n-d1);
end
for n = Fs*2+1:Fs*10     % Finally there is only delay 
    out(n,1) = a1*out(n-d1);  % After input finished
end
t = [0:N-1]*Ts;
subplot(1,2,1);
stem(t,imp); % Plot the Impulse Response
axis([-0.1 2 -0.1 1.1]);
xlabel('Time (sec.)');
title('Input Impulse');
subplot(1,2,2);
t = [0:length(out)-1]*Ts;
stem(t,out); % Plot the Impulse Response
axis([-0.1 10 -1.1 1.1]);
xlabel('Time (sec.)');
title('Output Impulse Response');

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
