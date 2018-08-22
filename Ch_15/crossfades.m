% CROSSFADES
% This function is used for modulated delay effects which
% require a crossfade between two different delays. The function
% returns the amplitude values for two different paths assuming
% a sawtooth LFO. 
%
% Input variables
%   Fs : sampling rate
%   len : total length in samples for a1 and a2
%   Hz : number of fades per second
%   fade : duration of overlap in samples

function [g1,g2] = crossfades(Fs,len,Hz,fade)

period = Fs/Hz;

win = hann(fade*2);  

n = 1;
g1 = zeros(len,1);
g2 = zeros(len,1);
while n < len
    
    % Position of "n" relative to a cycle
    t = mod(n,period);
    if t < period/2 - fade %fade/2
        g1(n,1) = 1;
        g2(n,1) = 0;
        c = 1;
    elseif t < period/2 %+ fade/2 % 1st fade
        g1(n,1) = win(fade+c,1)^0.5;
        g2(n,1) = win(c,1)^0.5;
        c = c+1;
    elseif t < period - fade
        g1(n,1) = 0;
        g2(n,1) = 1; 
        c = 1;
    else                        % 2nd fade
        g1(n,1) = win(c,1)^0.5;
        g2(n,1) = win(fade+c,1)^(0.5);
        c = c+1;
    end
    n = n + 1;
end
    
    



