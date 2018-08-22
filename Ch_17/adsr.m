% ADSR
% This function can be used to apply an
% adsr envelope on to an input signal.
%
% Input Variables
%   attackTime : length of attack ramp in milliseconds
%   decayTime : length of decay ramp in ms
%   sustainAmplitude : linear amplitude of sustain segment
%   releaseTime : length of release ramp in ms

function [ y ] = adsr( x,Fs,attackTime,decayTime,...
    sustainAmplitude,releaseTime) 

%Convert time inputs to seconds 
attackTimeS = attackTime / 1000;
decayTimeS = decayTime / 1000;
releaseTimeS = releaseTime / 1000;

%Convert seconds to samples and determine sustain time
a = round(attackTimeS * Fs);     % Round each to an integer
d = round(decayTimeS * Fs);      % number of samples
r = round(releaseTimeS * Fs);
s = length(x) - (a+d+r);       % Determine length of sustain

%Create linearly spaced fades for A,D, and R. Creates hold for S
aFade = linspace(0,1,a)';
dFade = linspace(1,sustainAmplitude,d)';
sFade = sustainAmplitude * ones(s,1);
rFade = linspace(sustainAmplitude,0,r)';

%Concactenates total ADSR curve
adsr = [aFade;dFade;sFade;rFade];

%Applies ADSR shaping to X
y = x .* adsr;

end

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
