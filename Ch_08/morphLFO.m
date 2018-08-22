% MORPHLFO
%
% This script demonstrates the method of morphing
% the LFO signal for the Tremolo effect from
% a triangle wave to a square wave
%
% See also AMPMODULATION

clear; clc; close all;

% Initial Parameters
Fs = 48000; Ts = 1/Fs;
f = 1; % 1 Hz LFO
t = 0:Ts:1; t = t(:);

% Consider a parameter knob with values from 1 - 10
knobValue = 10;
lfo = sawtooth(2*pi*f*t+pi/2,0.5); 
N = length(lfo);
lfoShape = zeros(N,1);
for n = 1:N
   
   if lfo(n,1) >= 0
       % This process is similar to adding an exponent
       % to a linear fade. It turns it into an
       % exponential, convex curve. In this case, it
       % turns the straight line of a triangle wave
       % into a curve closer to a square wave.
       lfoShape(n,1) = lfo(n,1) ^ (1/knobValue);
   else 
       % Need to avoid using negative numbers with power function
       lfoShape(n,1) = -1*abs(lfo(n,1)) ^ (1/knobValue);
   end
end

plot(t,0.5*lfo+0.5,t,0.5*lfoShape+0.5);
legend('Triangle, Knob = 1','Square, Knob = 10');

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
