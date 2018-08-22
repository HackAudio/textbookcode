% LFOPITCH
% This script demonstrates an example of pitch shifting
% using a sawtooth LFO to modulate delay time. 
% The result is a signal which has been pitch shifted
% based on the "semitones" variable. 
%
% An important aspect of this algorithm is to
% avoid having the processed signal be a different
% length than the original signal. To make this
% possible, the maximum delay time is 50 ms. A
% sawtooth LFO is used to modulate the delay time
% between 0 ms and 50 ms based on the necessary
% rate of change. If the delay time is about to 
% go outside of this range, a new cycle of the 
% sawtooth begins. 
%
% The output signal has audible clicks and pops 
% due to the discontinuities of the modulated delay.
% This motivates the use of two parallel delay lines
% which crossfade back and forth to smooth over the
% discontinuities.
%
% See also BASICPITCH, PITCHSHIFTER, PITCHSHIFTEREXAMPLE

clc;clear;close all;
% Synthesize 1 Hz Test Signal
[in,Fs] = audioread('AcGtr.wav');
Ts = 1/Fs;

semitones = 1;     % (-12,-11,...,-1,0,1,2,...,11,12,...)
tr = 2^(semitones/12);
dRate = 1 - tr;       % Delay Rate of Change

maxDelay = Fs * .05;  % Maximum Delay is 50 ms

% Conditional to handle pitch up and pitch down
if dRate > 0   % Pitch Decrease
    d = 0;
    
else           % Pitch Increase
    % Initialize delay so it is always positive
    d = maxDelay;     
end
    
N = length(in);
out = zeros(N,1);
lfo = zeros(N,1);
buffer = zeros(maxDelay+1,1);
for n = 1:N
    % Determine output of delay buffer
    % which could be a fractional delay time
    intDelay = floor(d); 
    frac = d - intDelay;
    
    if intDelay == 0 % When delay time = zero, 
                     % "out" comes "in", not just delay buffer
        out(n,1) = (1-frac) * in(n,1) + ...
            frac * buffer(1,1);
    else
        out(n,1) = (1-frac) * buffer(intDelay,1) + ...
            frac * buffer(intDelay+1,1);
    end
    
    % Store the current output in appropriate index
    buffer = [in(n,1);buffer(1:end-1,1)];
    
    % Store the current delay in signal for plotting 
    lfo(n,1) = d;
    d = d+dRate; % Change the delay time for the next loop
    
    % If necessary, start a new cycle in LFO
    if d < 0     
        d = maxDelay;
    elseif d > maxDelay
        d = 0;
    end
end
sound(out,Fs);

t = [0:N-1]*Ts;
subplot(3,1,1);
plot(t,lfo); % Cross-fade gains
ylabel('Delay (Samples)'); axis tight;

% Spectrogram 
nfft = 2048; % length of each time frame
window = hann(nfft); % calculated windowing function
overlap = 128; % Number of samples for frame overlap
[y,f,tS,p] = spectrogram(out,window,overlap,nfft,Fs);
subplot(3,1,2:3);
surf(tS,f,10*log10(p),'EdgeColor','none');
axis xy; axis tight; view(0,90);
xlabel('Time (sec.)');ylabel('Frequency (Hz)');

% This figure plots the equivalent sawtooth signal
% to the LFO synthesized during the loop
figure;
tau = (maxDelay/dRate) * Ts;
f = 1/tau;
plot(t,lfo,t,maxDelay*(0.5*sawtooth(2*pi*f*t)+0.5),'r--');
axis tight;
