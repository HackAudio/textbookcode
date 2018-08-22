% SLEWRATEDISTORTION
% This function implements slew-rate distortion. Frequencies
% greater than the "maxFreq" parameter are distorted.
% Frequencies less than "maxFreq" are not distorted. This type
% of distortion occurs in op-amps used for audio.
% 
% Input Variables
%   in : input signal to be processed
%   Fs : sampling rate
%   maxFreq : the limiting/highest frequency before distortion

function [out] = slewRateDistortion(in,Fs,maxFreq)

Ts = 1/Fs;
peak = 1;
slewRate = maxFreq*2*pi*peak; % Convert freq to slew rate

slope = slewRate*Ts; % Convert slew rate to slope/sample

out = zeros(size(in));      % Total number of samples
prevOut = 0;         % Initialize feedback delay sample
for n = 1:length(in)
    
    % Determine the change between samples
    dlta = in(n,1) - prevOut;
    if dlta > slope  % Don't let dlta exceed max slope 
        dlta = slope;
    elseif dlta < -slope
        dlta = -slope;
    end
    
    out(n,1) = prevOut + dlta;
    prevOut = out(n,1); % Save current "out" for next loop 
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

