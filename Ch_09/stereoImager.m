% STEREOIMAGER
% This script demonstrates the stereo image widening effect. 
% The effect is based on mid-side processing. The parameter 
% "width" can be used to make the example drums file sound
% wider or narrower.
%
% See also MIDSIDEPROCESSING

clc; clear;
[in,Fs] =audioread('stereoDrums.wav');

% Splitting signal into right and left channels
L = in(:,1);
R = in(:,2);

% Create Mid and Side Channels
side = 0.5 * (L-R);
mid = 0.5 * (L+R);

% Width Amount (wider if > 1, narrower if < 1)
width = 1.5;

% Scale the mid/side with width
sideNew = width .* side;
midNew = (2 - width) .* mid;

% Create new M/S signal
newLeft = midNew + sideNew;
newRight = midNew - sideNew;

% Combine Signals, Concatenated side-by-side, 2 columns
out = [newLeft , newRight];

% Play the sound 
sound(out,Fs) 

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

