% TRANSIENTEXAMPLE
% This script demonstrates the Transient Designer function
%
% See also TRANSIENTDESIGNER, TRANSIENTANALYSIS
clear; clc;

[in,Fs]=audioread('AcGtr.wav');

% Attack and Sustain Parameters [-1,+1]
attack = 0;
sustain = 1;

out = transientDesigner(in,attack,sustain);

plot(out,'r'); hold on;
plot(in,'b'); hold off;
legend({'Output','Input'},'FontSize',14);

sound(out,Fs);

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
