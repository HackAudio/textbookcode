% BASICPITCHDOWN
% This script demonstrates a basic example of
% pitch shifting down an octave created by 
% using a modulated time delay.
%
% See also BASICPITCHUP, BASICPITCH
clc;clear;
% Synthesize 1 Hz Test Signal
Fs = 48000; Ts = 1/Fs;
t = [0:Ts:1].'; f = 1; 
in = sin(2*pi*f*t);
x = [in ; zeros(Fs,1)];  % Zero-pad input because output 2x length

% Initialize Loop for Pitch Decrease
d = 0;      % Initially start with no delay
N = length(x);
y = zeros(N,1);
buffer = zeros(Fs*2,1);

for n = 1:N   
    intDelay = floor(d); 
    frac = d - intDelay;
    if intDelay == 0   % When there are 0 samples of delay
                       % "y" is based on input "x" 
        y(n,1) = (1-frac) * x(n,1) + ...
            frac * buffer(1,1);
        
    else  % Greater than 0 samples of delay
          % Interpolate between delayed samples "in the past"
        y(n,1) = (1-frac) * buffer(intDelay,1) + ...
            frac * buffer(intDelay+1,1);
    end
    
    % Store the current input in delay buffer
    buffer = [x(n,1);buffer(1:end-1,1)];
    
    % Increase the delay time by 0.5 samples
    d = d + 0.5;
end
plot(t,in); hold on;
time = [0:length(y)-1]*Ts; time = time(:);
plot(time,y); hold off;
xlabel('Time (sec.)');ylabel('Amplitude');
legend('Input','Output');
