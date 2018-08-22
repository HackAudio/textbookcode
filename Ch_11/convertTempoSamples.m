% CONVERTTEMPOSAMPLES
% This script provides an examples for calculating a delay time 
% in units of samples which will be synchronized with the tempo
% of a song in units of beats per minutes (BPM).
%
% Assume a (4/4) time signature where a BEAT = QUARTER NOTE
%
% See also CONVERTSECSAMPLES

% Example - Convert Tempo Sync'd Delay to Samples

Fs = 48000; % arbitrary sampling rate 

beatsPerMin = 90; % arbitrary tempo in units of beats per minute

% Calculate Beats Per Second
beatsPerSec = beatsPerMin / 60; % 1 minute / 60 seconds

% Calculate # of Seconds Per Beat
secPerBeat = 1/beatsPerSec;

% Note Division
% 4 = whole, 2 = half, 1 = quarter, 0.5 = 8th, 0.25 = 16th
noteDiv = 1 ; 

% Calculate Delay Time in Seconds
timeSec = noteDiv * secPerBeat;

% Convert to Units of Samples
timeSamples = fix(timeSec * Fs); % round to nearest integer sample

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


