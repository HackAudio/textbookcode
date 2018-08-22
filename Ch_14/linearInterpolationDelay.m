% LINEARINTERPOLATIONDELAY
% This script demonstrates how to introduce a
% fractional (non-integer) delay. Linear interpolation
% is used to estimate an amplitude value in-between
% adjacent samples.

clear;clc;
in = [1 , zeros(1,9)]; % Horizontal for displaying in command window

fracDelay = 3.2;             % Fractional delay length in samples
intDelay = floor(fracDelay); % Round down to get the previous (3)
frac = fracDelay - intDelay; % Find the fractional amount (0.2)

buffer = zeros(1,5); % length(buffer) >= ceil(fracDelay)

N = length(in);
out = zeros(1,N);
% Series Fractional Delay
for n = 1:N
    
    out(1,n) = (1-frac) * buffer(1,intDelay) + ...
        (frac) * buffer(1,intDelay+1);
    
    buffer = [in(1,n)  buffer(1,1:end-1)];
end

% Compare the input & output signals
disp(['The orig. input signal was: ', num2str(in)]);
disp(['The final output signal is: ', num2str(out)]);