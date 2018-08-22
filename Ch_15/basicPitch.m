% BASICPITCH
% This script demonstrates a basic example of
% pitch shifting created by 
% using a modulated time delay.
clc;clear;
% Synthesize 1 Hz Test Signal
Fs = 48000; Ts = 1/Fs;
t = [0:Ts:1].'; 
f = 110;             % Musical Note A2 = 110 Hz
in = sin(2*pi*f*t);

% Pitch Shift Amount
semitones = -12;     % (-12,-11,...,-1,0,1,2,...,11,12,...)
tr = 2^(semitones/12);
dRate = 1 - tr;       % Delay Rate of Change

% Conditional to handle pitch up or pitch down
if dRate > 0   % Pitch Decrease
    d = 0;
    x = [in ; zeros(Fs,1)]; % Prepare for signal to be elongated
    
else           % Pitch Increase
    % Initialize delay so it is always positive
    d = length(in)*-dRate;     
    x = in;
end
    
N = length(x);
y = zeros(N,1);
buffer = zeros(Fs*2,1);
for n = 1:N-1
    intDelay = floor(d); 
    frac = d - intDelay;
    if intDelay == 0 
        y(n,1) = (1-frac) * x(n,1) + ...
            frac * buffer(1,1);
    else
        y(n,1) = (1-frac) * buffer(intDelay,1) + ...
            frac * buffer(intDelay+1,1);
    end
    % Store the current output in appropriate index
    buffer = [x(n,1);buffer(1:end-1,1)];
    d = d+dRate;
end
plottf(in,Fs);figure; % A2 = 110 Hz
plottf(y,Fs);         % A1 = 55 Hz
