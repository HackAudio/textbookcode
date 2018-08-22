% GONIOMETEREXAMPLE
%
% This script demonstrates several example plots
% of the goniometer. 
%
% Examples include a signal panned to the center,
% left, and right. Finally, an example is shown
% for when the left and right channels have opposite
% polarity.
%
% See also GONIOMETER

% Test Signal
Fs = 48000; Ts = 1/Fs;
f = 10; t = [0:Ts:.1].';
x = sin(2*pi*f*t);

% Center
panCenter = [0.707*x , 0.707*x];
subplot(2,2,1);
goniometer(panCenter);

% Left
panLeft = [x , zeros(size(x))];
subplot(2,2,2);
goniometer(panLeft);

% Right
panRight = [zeros(size(x)),x];
subplot(2,2,3);
goniometer(panRight);

% Opposite Polarities
polarity = [0.707 * x , 0.707 * (-x)];
subplot(2,2,4);
goniometer(polarity);

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
