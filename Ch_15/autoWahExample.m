% AUTOWAHEXAMPLE
% This script implements an auto-wah effect using
% a bi-quad filter as the resonant LPF. 
%
% See also BIQUADWAH

clear;clc;
[in,Fs] = audioread('AcGtr.wav');
Ts = 1/Fs;
rate = 0.5; % Hz (frequency of LFO)
centerFreq = 1500; % Hz (center freq of LFO)
depth = 1000; % Hz (LFO range = 500 to 2500)

% Feed-forward Delay Buffer
ff = [0 ; 0]; % ff(n,1) = n-samples of delay  

% Feed-back Delay Buffer
fb = [0 ; 0]; % fb(n,1) = n-samples of delay

% Bandwidth of resonant LPF
Q = 7;

% Wet/Dry Mix
wet = 100;

% Initialize Output Signal
out = zeros(size(in));

for n = 1:length(in)
    t = (n-1) * Ts;
    lfo = depth*sin(2*pi*rate*t) + centerFreq;
    
    % Use Bi-quad Wah Effect Function
    [out(n,1),ff,fb] = biquadWah(in(n,1),Fs,...
        lfo,Q,ff,fb,wet);
    
end

sound(out,Fs);

% Spectrogram - notice resonances in shape of sine wave
nfft = 2048; 
window = hann(nfft); 
overlap = 128;
[y,f,t,p] = spectrogram(out,window,overlap,nfft,Fs);
surf(t,f,10*log10(p),'EdgeColor','none');
axis xy; axis tight; view(0,90);
xlabel('Time (sec.)');ylabel('Frequency (Hz)');