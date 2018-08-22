% CUBICINTERPOLATIONDELAY
% This script demonstrates how to introduce a
% fractional (non-integer) delay. Cubic interpolation
% is used to estimate an amplitude value in-between
% adjacent samples.

clear;clc;
in = [1 , zeros(1,9)]; % Horizontal for displaying in command window

fracDelay = 3.2;             % Fractional delay length in samples
intDelay = floor(fracDelay); % Round down to get the previous (3)
frac = fracDelay - intDelay; % Find the fractional amount (0.2)

buffer = zeros(1,5); % length(buffer) >= ceil(fracDelay)+1

N = length(in);
out = zeros(1,N);
% Series Fractional Delay
for n = 1:N
    % Calculate intermediate variable for cubic interpolation
    a0 = buffer(1,intDelay+2) - buffer(1,intDelay+1) - ...
        buffer(1,intDelay-1) + buffer(1,intDelay);
    
    a1 = buffer(1,intDelay-1) - buffer(1,intDelay) - a0;
    
    a2 = buffer(1,intDelay+1) - buffer(1,intDelay-1);
    
    a3 = buffer(1,intDelay);
    
    % 
    out(1,n) = a0*(frac^3) + a1*(frac^2) + a2*frac + a3;
    
    buffer = [in(1,n)  buffer(1,1:end-1)];    % Shift buffer
end

% Compare the input & output signals
disp(['The orig. input signal was: ', num2str(in)]);
disp(['The final output signal is: ', num2str(out)]);

plot(out);
% Observe in this plot, the impulse at sample n=1 is delayed
% by 3.2 samples. Therefore, the output signal should have
% an impulse at time 4.2 samples. With cubic interpoloation
% this impulse contributes to the amplitude of the output 
% signal at samples 3,4,5,6. The result of cubic interpolation
% is a closer approximation to the underlying (smooth) 
% continuous signal than linear interpolation.
