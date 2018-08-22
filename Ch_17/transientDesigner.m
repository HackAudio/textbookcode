% TRANSIENTDESIGNER
% This function implements the transient designer
% audio effect. First, a detection analysis is performed
% to determine the sections of the signal which should 
% be labeled "attack" and "sustain". Then the amplitude
% of these sections is scaled based on the input parameters
%
% Input Variables
%   attack : amount to change transient (-1 dec, 0 unity, +1 inc)
%   sustain : amount to change sustain
%
% See also TRANSIENTANALYSIS


function [out] = transientDesigner(in,attack,sustain)

N = length(in);
% Initialize Filtering Parameters
gFast = 0.9991;   % Feed-back gain for the "fast" envelope
fbFast = 0;       % Variable used to store previous envelope value
gSlow = 0.9999;   % Feed-back gain for "slow" envelope
fbSlow = 0;
envFast = zeros(N,1);
envSlow = zeros(N,1);
differenceEnv = zeros(N,1);

% Measure Fast and Slow Envelopes
for n = 1:N
    
    envFast(n,1) = (1-gFast) * 2 * abs(in(n,1)) + gFast * fbFast;
    fbFast = envFast(n,1);
    
    envSlow(n,1) = (1-gSlow) * 3 * abs(in(n,1)) + gSlow * fbSlow;
    fbSlow = envSlow(n,1);
    
    % Create the difference envelope between "fast" and "slow"
    differenceEnv(n,1) = envFast(n,1) - envSlow(n,1);
    % Note: difference envelope will have a positive value
    % when envFast is greater than envSlow. This occurs
    % when the signal is in "attack". If the difference
    % envelope is negative, then the signal is in
    % "sustain".
end

attEnv = zeros(N,1);
susEnv = zeros(N,1);
% Separate Attack and Sustain Envelopes
for n = 1:N
   
    if differenceEnv(n,1) > 0 % "Attack" section
        
        attEnv(n,1) = (attack * differenceEnv(n,1)) + 1;
        susEnv(n,1) = 1; % No change
        
    else % "Sustain" section
        
        attEnv(n,1) = 1; % No change
        susEnv(n,1) = (sustain * -differenceEnv(n,1)) + 1;
        
    end
    
end

% Apply the Attack and Sustain Envelopes
out = (in .* attEnv) .* susEnv;

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
