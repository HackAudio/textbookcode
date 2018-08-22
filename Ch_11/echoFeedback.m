% ECHOFEEDBACK
% This script demonstrates one example to create a
% feed-back, tempo-synchronized echo effect
%
% See also ECHOSYNC

% Import our audio file
[x,Fs] = audioread('AcGtr.wav');

% Known tempo of recording
beatsPerMin = 102;  % units of beats per minute

% Calculate Beats Per Second
beatsPerSec = beatsPerMin / 60; % 1 minute / 60 seconds

% Calculate # of Seconds Per Beat
secPerBeat = 1/beatsPerSec;

% Note Division
% 4 = whole, 2 = half, 1 = quarter, 0.5 = 8th, 0.25 = 16th
noteDiv = 0.5 ; 

% Calculate Delay Time in Seconds
timeSec = noteDiv * secPerBeat;

% Convert to Units of Samples
d = fix(timeSec * Fs); % round to nearest integer sample

a = -0.75; % amplitude of delay branch

% Index each element of our signal to create the output
N = length(x);
y = zeros(N,1);
for n = 1:N
    
    % When the sample number is less than the time delay
    % Avoid indexing a negative sample number
    if n < d+1
        % output = input
        y(n,1) = x(n,1);
     
    % Now add in the delayed signal   
    else
        % output = input + delayed version of output
        % reduce relative amplitude of delay to 3/4
        y(n,1) = x(n,1) + (-a)*y(n-d,1);    
    end
end

sound(y,Fs); % Listen to the effect

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
