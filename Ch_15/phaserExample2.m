% PHASEREXAMPLE2
% This script implements a phaser effect using
% a bi-quad filter as the APF. 
%
% See also BIQUADPHASER

clear;clc;
Fs = 48000; Ts = 1/Fs;
sec = 5;
lenSamples = sec*Fs;
in = 0.2*randn(lenSamples,1);

rate = 0.8; % Hz (frequency of LFO)
centerFreq = 1000; % Hz (center freq of LFO)
depth = 500; % Hz (LFO range = 500 to 1500)

% Feed-forward Delay Buffer
ff = [0 ; 0]; % ff(n,1) = n-samples of delay  

% Feed-back Delay Buffer
fb = [0 ; 0]; % fb(n,1) = n-samples of delay

% Bandwidth of Phaser (wide or narrow notch)
Q = 0.5;

% Wet/Dry Mix
wet = 50;

% Initialize Output Signal
out = zeros(size(in));

for n = 1:length(in)
    t = (n-1) * Ts;
    lfo = depth*sin(2*pi*rate*t) + centerFreq;
    
    % Use Bi-quad Phaser Effect Function
    [out(n,1),ff,fb] = biquadPhaser(in(n,1),Fs,...
        lfo,Q,ff,fb,wet);
    
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