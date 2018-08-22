% STEPDEMO
% This script demonstrates the process of measuring
% the step response of a 1st-order, feed-back LPF.
% A plot is created showing a comparison between
% the input step signal and the output response.

% Initialize the Sampling Rate
Fs = 48000; Ts = 1/Fs;

% Create Step Input Signal
x = [zeros(Fs,1) ; ones(Fs,1)];
N = length(x);
% Initialize gain value
alpha = 0.9995;  % Also try values between 0.999-0.9999
q = 0; % Initialize feedback variable
for n = 1:N
    y(n,1) = (1-alpha) * x(n,1) + alpha * q;
    q = y(n,1); % Stores the "previous" value for the next loop cycle
end

t = [0:N-1]*Ts; % Time vector for plot
plot(t,x,t,y);
axis([0 2 -0.1 1.1]); xlabel('Time (sec.)');
legend('Step Input','Output');

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
