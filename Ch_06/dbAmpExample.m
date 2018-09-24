% DBAMPEXAMPLE
% This script provides an example for changing the amplitude 
% of a signal on a decibel (dB) scale
%
% See also DBAMPCHANGE

% Example - Sine wave test signal
[sw1,Fs] = audioread('sw20Hz.wav');
sw2 = dbAmpChange(sw1,6);
sw3 = dbAmpChange(sw1,-6);

% Plot the result
Ts = 1/Fs;
N = length(sw1);
t = [0:N-1]*Ts; t=t(:);
plot(t,sw1,'.',t,sw2,t,sw3,'--');
xlabel('Time (sec.)');
ylabel('Amplitude');
title('Changing the Amplitude of a Signal on a dB Scale');
legend('SW1','+6 dB','-6 dB');

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


