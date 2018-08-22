% FIR2EXAMPLE
% This script demonstrates the syntax of
% the 'fir2' function to create a filter with
% arbitrary frequency response
%
% See also FIR2

% Declare function parameters
n = 30;   % filter order
frqs = [0, 0.2, 0.5,0.8,1];    % normalized frequencies
amps = [2, 4, 0.25,2,1];  % linear amplitudes for each freq


% Syntax for function
h = fir2(n,frqs,amps);

% Plot Frequency Response
freqz(h);

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
