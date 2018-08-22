% PHASEREXAMPLE
% This script demonstrates the use of a phaser
% function to add the effect to white noise. Parameters
% of the phaser effect include the rate and depth of 
% the LFO. In this implementation, the delay time of
% an APF (Direct Form II) is modulated.
%
% See also PHASEREFFECT

clear;clc;
Fs = 48000; Ts = 1/Fs;
sec = 5;
lenSamples = sec*Fs;
in = 0.2*randn(lenSamples,1);

rate = 0.8; % Hz (frequency of LFO)
depth = 0.3; % Samples (amplitude of LFO)

% Initialize Delay Buffers
buffer = zeros(3,1); % All-pass Filter

% Wet/Dry Mix
wet = 50;

% Initialize Output Signal
out = zeros(size(in));

for n = 1:length(in)
    
    % Use Phaser Effect Function
    [out(n,1),buffer] = phaserEffect(in(n,1),buffer,Fs,n,...
    depth,rate,wet);
    
end

sound(out,Fs);

% Spectrogram 
nfft = 2048; 
window = hann(nfft); 
overlap = 128;
[y,f,t,p] = spectrogram(out,window,overlap,nfft,Fs);
surf(t,f,10*log10(p),'EdgeColor','none');
axis xy; axis tight; view(0,90); %view(-30,60);
xlabel('Time (sec.)');ylabel('Frequency (Hz)');