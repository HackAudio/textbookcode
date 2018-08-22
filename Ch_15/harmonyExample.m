% HARMONYEXAMPLE
% This script creates a harmony effect by 
% blending together a pitch shifted signal
% with the original, unprocessed signal. 
%
% See also PITCHSHIFTER, PITCHSHIFTEREXAMPLE

clc;clear;
% Import acoustic guitar recording for processing
[in,Fs] = audioread('AcGtr.wav');

% Pitch Shifted Down a Perfect 4th
semitones = -5; 
processed = pitchShifter(in,Fs,semitones);

% Blend Together Input and Processed
out = 0.5 * (in + processed);
sound(out,Fs);
% sound(in,Fs); % For comparison