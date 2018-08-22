% CISIMULATION
% This script performs vocoding
% using speech and white noise. This process
% is used to simulate cochlear implants
% for listeners with acoustic hearing
%
% See also VOCODEREXAMPLE

clc;clear;close all;

% Import Audio Files
[in,Fs] = audioread('Voice.wav');
N = length(in);
noise = 0.1 * randn(N,1);

% Initialize filter parameters
Nyq = Fs/2;
order = 2; % Filter Order

numOfBands = 16;

% Logarithmically space cut-off frequencies
% 2*10^1 - 2*10^4 (20-20k) Hz
freq = 2 * logspace(1,4,numOfBands+1);

g = 0.9992; % Smoothing Filter Gain
fb = 0;     % Initialize feedback delay 

voxBands = zeros(N,numOfBands);
noiseBands = zeros(N,numOfBands);
envBands = zeros(N,numOfBands);

for band = 1:numOfBands
   
    Wn = [freq(band) , freq(band+1)] ./ Nyq;
    [b,a] = butter(order,Wn);
    
    % Filterbank
    voxBands(:,band) = filter(b,a,in);
    noiseBands(:,band) = filter(b,a,noise);
    
    % Envelope Measurement
    for n = 1:N
    
        envBands(n,band) = (1-g) * abs(voxBands(n,band)) + g * fb;
        fb = envBands(n,band);
    
    end
    fb = 0;
    
end

% Perform Amplitude Modulation
outBands = zeros(length(in),numOfBands);
for band = 1:numOfBands
   
    outBands(:,band) = envBands(:,band) .* noiseBands(:,band); 
    
end

% Sum together all the bands
out = sum(outBands,2);
% Make-up Gain
out = 32 * out;

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

