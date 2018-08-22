% BIQUADSTEP
% This script demonstrates the result of taking the
% step response of a bi-quad LPF. Examples include
% changing the cut-off frequency and Q.
%
% See also BIQUADFILTER

clc;clear;close all;
% Input signal
Fs = 48000; Ts = 1/Fs;
x = ones(2*Fs,1); % Step Input 
N = length(x);
t = [0:N-1] * Ts; t = t(:);

% Changing the Cut-off Frequency
Q = 1.414;
dBGain = 0;
figure(1); hold on;
for freq = 1:4
     y = biquadFilter(x,Fs,freq,Q,dBGain,'lpf',1);
     plot(t,y);
end
hold off;legend('f = 1','f = 2','f = 3','f = 4');
xlabel('Time (sec.)');

% Changing the Bandwidth Q
freq = 1;
dBGain = 0;
figure(2); hold on;
for Q = 0.707/2:0.707/2:1.414
     y = biquadFilter(x,Fs,freq,Q,dBGain,'lpf',1);
     plot(t,y);
end
hold off;legend('Q = 0.3535','Q = 0.707','Q = 1.0605','Q = 1.414');
xlabel('Time (sec.)');

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
