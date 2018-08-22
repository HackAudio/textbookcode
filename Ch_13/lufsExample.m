% LUFSEXAMPLE
% This script demonstrates the use of the lufs
% function for calculating loudness based
% on the LUFS/LKFS standard. Four examples
% are shown. First, a mono recording of
% an electric guitar is analyzed. Second,
% a stereo recording of drums is analyzed.
% 
% Then, two more examples are demonstrated using
% test signals provided by the European Broadcast
% Union (EBU) for the sake of verifying proper 
% measurement. A filtered pink noise signal 
% is measured with a loudness of -23 LUFS. Finally,
% a sine wave signal is measured with a loudness 
% of -40 LUFS.
%
% See also LUFS
clc;clear;

% Example 1 - Mono Electric Guitar
sig1 = audioread('RhythmGuitar.wav');
loudnessGuitar = lufs(sig1)

% Example 2 - Stereo Drums
sig2 = audioread('stereoDrums.wav');
loudnessDrums = lufs(sig2)

% Example 3 - Filtered noise signal provide by EBU for verification
fnm='EBU-reference_listening_signal_pinknoise_500Hz_2kHz_R128.wav';
sig3 = audioread(fnm);
loudnessNoise = lufs(sig3)  % Should equal -23 LUFS

% Example 3 - Sinewave provide by EBU for verification
sig4 = audioread('1kHz Sine -40 LUFS-16bit.wav');
loudnessSine = lufs(sig4) % Should equal -40 LUFS

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


