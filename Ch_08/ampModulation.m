% AMPMODULATION
% This script provides an example for modulating 
% the amplitude of a carrier signal. This process
% is called Tremolo when used as an audio effect

clear;clc;close all;

% Import Carrier Signal
[carrier,Fs] = audioread('RhythmGuitar.wav');
Ts = 1/Fs; 
N = length(carrier);
t = [0:N-1]*Ts; t = t(:);
plot(t,carrier);title('Original Soundfile (Electric Guitar)');
xlabel('Time (sec.)');figure;

% Tremolo Parameters
depth = 100; % [0,100]
speed = 5;
amp = 0.5*(depth/100);
offset = 1 - amp;

% Synthesize Modulation Signal
f = speed;  % speed of effect
phi = 0;
sw = sin(2*pi*f.*t+phi);

mod = amp.*sw + offset;  

% Plot to compare the original sine wave with the modulator
% Index only first second of signal for visualization purposes
plot(t(1:Fs),sw(1:Fs),t(1:Fs),mod(1:Fs));
title('Modulator Signal');figure;

% Modulate the amplitude of the carrier by the modulator
output = carrier.*mod;

% Plot the output and listen to the result
plot(t(1:Fs),carrier(1:Fs));
title('Carrier Signal (Unprocessed)');
figure;plot(t(1:44100),output(1:44100));
title('Output Signal (Processed)');
sound(output,Fs);

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
