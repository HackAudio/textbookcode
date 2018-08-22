% BARBERPOLEEXAMPLE
%
% This script creates a barberpole flanger effect using 
% a single delay buffer. The delay time is modulated
% by a sawtooth LFO. There is audible distortion each
% time the LFO starts a new cycle. 
%
% This script produces a plot with the delay time 
% of the LFO and the spectrogram of white noise processed
% by the effect.
%
% See also BARBERPOLE2EXAMPLE

clear;clc;
Fs = 48000; Ts = 1/Fs;
sec = 8;
lenSamples = sec*Fs;
in = 0.2*randn(lenSamples,1);
t = [0:lenSamples-1].' * (1/Fs);

% Create delay buffer to be hold maximum possible delay time
maxDelay = 50+1; 
buffer = zeros(maxDelay,1); 

rate = 0.5; % Hz (frequency of LFO)
depth = 6; % Samples (amplitude of LFO)
predelay = 12; % Samples (offset of LFO)

% Wet/Dry Mix
wet = 50;  % 0 = Only Dry, 100 = Only Wet


% Initialize Output Signal
N = length(in);
out = zeros(N,1);
lfo = zeros(N,1);

for n = 1:N
    
    % Use flangerEffect.m function
    [out(n,1),buffer,lfo(n,1)] = ...
        barberpoleFlanger(in(n,1),buffer,Fs,n,...
        depth,rate,predelay,wet);
    
end

sound(out,Fs);

% Waveform
subplot(3,1,1);
plot(t,lfo);
axis([0 length(t)*(1/Fs) 5 20]);
ylabel('Delay');

% Spectrogram 
nfft = 2048; % length of each time frame
window = hann(nfft); % calculated windowing function
overlap = 128; % Number of samples for frame overlap
[y,f,tS,p] = spectrogram(out,window,overlap,nfft,Fs);

% Lower Subplot
subplot(3,1,2:3);
surf(tS,f,10*log10(p),'EdgeColor','none');
axis xy; axis tight; view(0,90);
xlabel('Time (sec.)');ylabel('Frequency (Hz)');


