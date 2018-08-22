% ADSREXAMPLE
% This script creates a linear ADSR amplitude envelope
%
% See also ADSR

% Number of Samples per fade
a = 20;
d = 20;
s = 70;
r = 40;

sustainAmplitude = 0.75;

% Create each segment A,D,S,R
aFade = linspace(0,1,a)';
dFade = linspace(1,sustainAmplitude,d)';
sFade = sustainAmplitude * ones(s,1);
rFade = linspace(sustainAmplitude,0,r)';


%Concactenates total ADSR envelope
env = [aFade;dFade;sFade;rFade];

plot(env);

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
