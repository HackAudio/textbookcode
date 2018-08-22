% PITCHSHIFTEREXAMPLE
% This script is an example to demonstrate
% the pitchShifter function for processing
% an audio signal. The desired number of 
% semitones can be set from within this script.
%
% See also PITCHSHIFTER, LFOPITCH, BASICPITCH 

clc;clear;
% Import acoustic guitar recording for processing
[in,Fs] = audioread('AcGtr.wav');

% Experiment with different values
% -12,-11,...,-1,0,1,2,...,11,12,...
semitones = 1;     

[out] = pitchShifter(in,Fs,semitones);

sound(out,Fs);
% sound(in,Fs); % For comparison