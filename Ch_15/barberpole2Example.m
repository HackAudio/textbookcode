% BARBERPOLE2EXAMPLE
% This script creates a barberpole flanger effect using 
% two delay buffers, which gradually fades back and forth
% between the buffers to have a smooth transition at
% the start of the sawtooth ramp.
%
% See also BARBERPOLEEXAMPLE
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
lfo1 = zeros(N,1);
lfo2 = zeros(N,1);
overlap = 18000; % Number of samples of overlap per crossfade     
[g1,g2] = crossfades(Fs,lenSamples,rate/2,overlap);

for n = 1:N
    
    % Use flangerEffect.m function
    [out(n,1),buffer,lfo1(n,1),lfo2(n,1)] = ...
        barberpoleFlanger2(in(n,1),buffer,Fs,n,...
        depth,rate,predelay,wet,g1(n,1),g2(n,1));
    
end

sound(out,Fs);

% Waveform
subplot(4,1,1);
plot(t,lfo1,t,lfo2);
axis([0 length(t)*(1/Fs) 8 16]);
ylabel('Delay');

subplot(4,1,2);
plot(t,g1,t,g2); % Cross-fade gains
ylabel('Amplitude');

% Spectrogram 
nfft = 2048; % length of each time frame
window = hann(nfft); % calculated windowing function
overlap = 128; % Number of samples for frame overlap
[y,f,tS,p] = spectrogram(out,window,overlap,nfft,Fs);

% Lower Subplot
subplot(4,1,3:4);
surf(tS,f,10*log10(p),'EdgeColor','none');
axis xy; axis tight; view(0,90);
xlabel('Time (sec.)');ylabel('Frequency (Hz)');


