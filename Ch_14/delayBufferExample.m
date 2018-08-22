% DELAYBUFFEREXAMPLES
% This script demonstrates several examples of creating different 
% types (FIR, IIR) of systems by using a delay buffer
%
% Execution of the script is set to "pause" during each iteration
% to allow a user to view the contents of the delay buffer
% during each step. To advance from one step to the next,
% press <ENTER>
%
% See also SIMPLELINEARBUFFER
clear;clc;
in = [1, -1, 2 , -2, zeros(1,6)];

buffer = zeros(1,20); % Longer buffer than delay length

% Number of samples of delay 
delay = 5; % Does not need to be the same length as buffer

N = length(in);
out = zeros(1,N);
% Series Delay
for n = 1:N
    
    out(1,n) = buffer(1,delay);
    buffer = [in(1,n) , buffer(1,1:end-1)];
    
end

% Compare the input & output signals
disp('Series Delay: 5 Samples');
disp('out(n) = in(n-5)');
disp(['The orig. input signal was: ', num2str(in)]);
disp(['The final output signal is: ', num2str(out)]);
pause; clc; % Press <ENTER> to continue


% Feed-forward (FIR) System
buffer = zeros(1,20);
delay = 3; % Number of samples of delay 

% Parallel Delay Line
for n = 1:N
    
    out(1,n) = in(1,n) + buffer(1,delay);
    buffer = [in(1,n) , buffer(1,1:end-1)];
    
end

disp('Feed-forward Delay: 3 samples');
disp('out(n) = in(n) + in(n-3)');
disp(['The orig. input signal was: ', num2str(in)]);
disp(['The final output signal is: ', num2str(out)]);
pause; clc; % Press <ENTER> to continue


% Feed-back (IIR) System
buffer = zeros(1,20);
for n = 1:N
    
    out(1,n) = in(1,n) + buffer(1,delay);
    buffer = [out(1,n) , buffer(1,1:end-1)];
    
end

disp('Feed-back Delay: 3 samples');
disp('out(n) = in(n) + out(n-3)');
disp(['The orig. input signal was: ', num2str(in)]);
disp(['The final output signal is: ', num2str(out)]);




