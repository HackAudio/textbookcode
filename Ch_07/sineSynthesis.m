% SINESYNTHESIS
% This script demonstrates two methods to synthesize
% sine waves
%
% Method 1: A loop is used to step through each 
% element of the arrays
%
% Method 2: Array processing is used to perform
% element-wise referencing by the 'sin' function 
% internally
%
% See also SINEANGLE, SINESPECTRUM

clear; clc;
% Example - Sine Wave Signal
% Declare initial parameters
f = 2; % Frequency in Hz
phi = 0; % phase offset
Fs = 100; % sampling rate
Ts = 1/Fs; % sampling period
lenSec = 1; % 1 second long signal
N = Fs*lenSec;  % Convert to time samples
out1 = zeros(N,1);
% Method 1: Loop to perform element-wise referencing
for n = 1:N
    % Note: a new time 't' is used
    % each time through the loop
    t = (n-1) * Ts;   % 't' is a scalar
     
    out1(n,1) = sin(2*pi*f*t+phi); 
    
end

% Method 2: Create signal using array processing
% Phase shifted signal of identical frequency
t = [0:(N-1)] * Ts;  % sample times
t = t(:); % make a column vector
out2 = sin(2*pi*f*t+pi/2);  % 90 degree phase shift

% Plot the 2 signals
plot(t,out1,t,out2);
xlabel('Time (sec.)'); ylabel('Amplitude');
legend('out1','out2');

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
