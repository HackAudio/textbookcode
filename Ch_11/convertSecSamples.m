% CONVERTSECSAMPLES
% This script provides two examples for converting a time delay
% in units of seconds to samples and milliseconds to samples
%
% See also CONVERTTEMPOSAMPLES

% Example 1 - Seconds to Samples

Fs = 48000; % arbitrary sampling rate 

timeSec = 1.5; % arbitrary time in units of seconds

% Convert to units of samples
timeSamples = fix(timeSec * Fs); % round to nearest integer sample


% Example 2 - Milliseconds to Samples

timeMS = 330; % arbitrary time in units of milliseconds

% Convert to units of seconds
timeSec = timeMS/1000; 

% Convert to units of samples
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
