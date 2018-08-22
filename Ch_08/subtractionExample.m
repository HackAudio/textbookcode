% SUBTRACTIONEXAMPLE
% This script provides two examples for combining signals 
% together using subtraction
%
% This first example is for signals of the same frequency and phase
%
% The second example shows the addition of signals where 
% one signal has a phase offset of 180 degrees (pi radians)
%
% See also ADDITIONEXAMPLE

% Example 1 - Same Frequency and Phase
% Declare initial parameters
f = 1;  a = 1; phi = 0; Fs = 100;
t = 0:1/Fs:1;
sw1 = a * sin(2*pi*f.*t+phi); sw2 = a * sin(2*pi*f.*t+phi);
% Element-wise subtraction
sw3 = sw1 - sw2;
% Plot the result
plot(t,sw1,'.',t,sw2,t,sw3,'--');
xlabel('Time (sec.)');
ylabel('Amplitude');
title('Subtraction of 2 Sine Waves - Same Frequency and Phase');
legend('SW1','SW2','SW1-SW2');

% Example 2 - Same frequency with a phase offset

sw1 = a * sin(2*pi*f.*t+0);
sw2 = a * sin(2*pi*f*t+pi); % Phase offset by 180 degrees

sw3 = sw1+sw2;
    
figure; % Create a new figure window
plot(t,sw1,'.',t,sw2,t,sw3,'--');
xlabel('Time (sec.)');
ylabel('Amplitude');
title('Addition of 2 Sine Waves - 180 degree phase offset');
legend('SW1','SW2','SW1-SW2');

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
