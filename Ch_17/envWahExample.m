% ENVWAHEXAMPLE
% This script implements an env-wah effect using
% a bi-quad filter as the resonant LPF after 
% analyzing the amplitude envelope of the input
% signal. 
%
% See also BIQUADWAH

clear;clc;
[x,Fs] = audioread('AcGtr.wav');
Ts = 1/Fs;
N = length(x);
% Initialize Feed-forward Delay Buffer 
% (stores 2 previous samples of input)
ff = [0 ; 0]; % ff(n,1) = n-samples of delay  

% Initialize Feed-back Delay Buffer 
% (stores 2 previous samples of output)
fb = [0 ; 0]; % fb(n,1) = n-samples of delay

% Bandwidth of resonant LPF
Q = 4;

% Wet/Dry Mix
wet = 100;

% Initialize Output Signal
y = zeros(N,1);
% Cut-off frequency from envelope
cutoff = zeros(N,1);  

% Envelope LPF Parameters
alpha = 0.9995;
envPreviousValue = 0;

for n = 1:N
    % Envelope Detection
    rect = abs(x(n,1));
    env = (1-alpha) * rect + (alpha)*envPreviousValue;
    envPreviousValue = env;
    
    % Scale Envelope for Cut-off Frequency of LPF
    freq = 1500 + 10000 * env;
    
    % Use Bi-quad Wah Effect Function
    [y(n,1),ff,fb] = biquadWah(x(n,1),Fs,...
        freq,Q,ff,fb,wet);
    % Store for Plotting
    cutoff(n,1) = freq;
end

sound(y,Fs);

t= [0:N-1]*Ts;

subplot(2,1,1);
plot(t,y);
xlabel('Time (sec.)');ylabel('Amplitude');
subplot(2,1,2);
plot(t,cutoff);
xlabel('Time (sec.)');ylabel('Cut-off Freq. (Hz)');

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
