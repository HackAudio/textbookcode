% BASICPITCHUP
% This script demonstrates a basic example of
% pitch shifting up an octave created by 
% using a modulated time delay.
%
% See also BASICPITCHDOWN, BASICPITCH
clc;clear;
% Synthesize 1 Hz Test Signal
Fs = 48000; Ts = 1/Fs;
t = [0:Ts:1].'; f = 1;
x = sin(2*pi*f*t);

d = Fs;                   % Initial Delay Time      
 
N = length(x);            % Number of samples
y = zeros(N,1);           % Initialize output signal  
buffer = zeros(Fs+1,1);   % Delay Buffer
for n = 1:N
    intDelay = floor(d); 
    frac = d - intDelay;
    if intDelay == 0 
        y(n,1) = (1-frac) * x(n,1) + ...
            frac * buffer(1,1);
    else
        y(n,1) = (1-frac) * buffer(intDelay,1) + ...
            frac * buffer(intDelay+1,1);
    end
    % Store the current input in delay buffer
    buffer = [x(n,1);buffer(1:end-1,1)];
    
    % Decrease the delay time by 1 sample
    d = d - 1;
end
plot(t,x); hold on;
plot(t,y); hold off;
xlabel('Time (sec.)');ylabel('Amplitude');
legend('Input','Output');
