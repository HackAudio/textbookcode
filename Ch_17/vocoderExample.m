% VOCODEREXAMPLE
% This script demonstrates the process of creating
% a vocoder effect using a Voice signal and
% Synth signal

clc;clear;close all;


% Import Audio Files
[in,Fs] = audioread('Voice.wav');
[synth] = audioread('Synth.wav');

% Initialize filter parameters
Nyq = Fs/2;   % Nyquist frequency
order = 2;    % Filter order

numOfBands = 16;

% Logarithmically space cut-off frequencies
% 2*10^1 - 2*10^4 (20-20k) Hz
freq = 2 * logspace(1,4,numOfBands+1);

g = 0.9992; % Smoothing Filter Gain
fb = 0;     % Initialize feedback delay 

N = length(in);

% These arrrays are used to store the filtered
% versions of the input signal. Each column stores
% the signal for each band. As an example, 
% voxBands(:,4) stores the band-pass filtered
% signal in 4th band. 
voxBands = zeros(N,numOfBands);
synthBands = zeros(N,numOfBands);
envBands = zeros(N,numOfBands);

for band = 1:numOfBands % Perform processing 1 band per loop
   
    % Determine lower and upper cut-off frequencies
    % of the current BPF on a normalized scale.
    Wn = [freq(band) , freq(band+1)] ./ Nyq;
    [b,a] = butter(order,Wn);
    
    % Filter signals and store the result 
    voxBands(:,band) = filter(b,a,in);
    synthBands(:,band) = filter(b,a,synth);
    
    % Envelope measurement from vocal signal
    for n = 1:N
    
        envBands(n,band) = (1-g) * abs(voxBands(n,band)) + g * fb;
        fb = envBands(n,band);
    
    end
    fb = 0;
    
end

% Perform Amplitude Modulation
outBands = zeros(length(in),numOfBands);
for band = 1:numOfBands
    
    % Apply the envelope of the vocal signal to the synthesizer
    % in each of the bands
    outBands(:,band) = envBands(:,band) .* synthBands(:,band); 
    
end

% Sum together all the bands
out = sum(outBands,2);
% Make-up Gain
out = 32 * out;

% Listen to the output and plot it
sound(out,Fs); plot(out);

% This source code is provided without any warranties as published in 
% "Hack Audio: An Introduction to Computer Programming and Digital Signal
% Processing in MATLAB" © 2019 Taylor & Francis.
% 
% It may be used for educational purposes, but not for commercial 
% applications, without further permission.
%
% Book available here (uncomment):
% url = ['https://www.routledge.com/Hack-Audio-An-Introduction-to-'...
% 'Computer-Programming-and-Digital-Signal/Tarr/p/book/9781138497559'];
% web(url,'-browser');
% 
% Companion website resources (uncomment):
% url = 'http://www.hackaudio.com'; 
% web(url,'-browser');

