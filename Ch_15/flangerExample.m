% FLANGEREXAMPLE
% This script creates a flanger effect, applied to white noise.
% Within the processing loop, a feed-back flanger can be 
% substituted for the feed-foward flanger used by default.
%
% See also FLANGEREFFECT
clear;clc;
Fs = 48000; Ts = 1/Fs;
sec = 5;
lenSamples = sec*Fs;
in = 0.2*randn(lenSamples,1); % White noise input

% Create delay buffer to be hold maximum possible delay time
maxDelay = 50+1; 
buffer = zeros(maxDelay,1); 

rate = 0.2; % Hz (frequency of LFO)
depth = 4; % Samples (amplitude of LFO)
predelay = 5; % Samples (offset of LFO)
wet = 50; % Wet/Dry Mix

% Initialize Output Signal
N = length(in);
out = zeros(N,1);

for n = 1:N
    
    % Use flangerEffect function
    [out(n,1),buffer] = flangerEffect(in(n,1),buffer,Fs,n,...
        depth,rate,predelay,wet);
    
    % Use feedbackFlanger function
    %[out(n,1),buffer] = feedbackFlanger(in(n,1),buffer,Fs,n,...
    %    depth,rate,predelay,wet);
    
end
sound(out,Fs);

% Spectrogram 
nfft = 2048; 
window = hann(nfft); 
overlap = 128;
[y,f,t,p] = spectrogram(out,window,overlap,nfft,Fs);
surf(t,f,10*log10(p),'EdgeColor','none');
axis xy; axis tight; view(0,90);
xlabel('Time (sec.)');ylabel('Frequency (Hz)');