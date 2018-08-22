% FEEDBACKDELAYEXAMPLE
% This script calls the feed-back delay function and passes in 
% the delay buffer
%
% See also FEEDBACKDELAY

clear;clc;
in = [1 ; -1 ; 2 ; -2 ; zeros(6,1)]; % Input signal

% Longer buffer than delay length to demonstrate
% delay doesn't just have to be the "end" of buffer
buffer = zeros(20,1); 

% Number of samples of delay 
delay = 5; 

% Feed-back Gain Coefficient
fbGain = 0.5;

% Initialize Output Vector
N = length(in);
out = zeros(N,1);

% Series Delay
for n = 1:N
    % Pass "buffer" into feedbackDelay function
    [out(n,1),buffer] = feedbackDelay(in(n,1),buffer,delay,fbGain);
    % Return updated "buffer" for next loop iteration
end
% Print and Compare Input and Output Signals
disp('Feed-back Delay: 5 samples');
disp('The orig. input signal was: ')
in
disp('The final output signal is: ');
out




