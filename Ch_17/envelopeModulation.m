% ENVELOPEMODULATION
% This script demonstrates the process of measuring an
% amplitude envelope from the waveform of a voice recording
% and using it modulate the amplitude of synth recording.

% Import Audio Files
[in,Fs] = audioread('Voice.wav');
[synth] = audioread('Synth.wav');

alpha = 0.9997;  % Feed-back gain
fb = 0;          % Initialized value for feedback
N = length(in);
env = zeros(N,1);
for n = 1:N
    % Analyze envelope
    env(n,1) = (1-alpha) * abs(in(n,1)) + alpha * fb;
    fb = env(n,1);
    
end
% Make-up Gain
env = 4*env;

% Amplitude Modulation of envelope applied to synthsizer
out = synth.*env;

sound(out,Fs);

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

