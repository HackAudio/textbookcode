%DBAMPCHANGE This function changes the amplitude of a signal
%   This function changes the amplitude of an input signal based on a
%   desired change relative to a decibel scale

function [ out ] = dbAmpChange( in,dBChange )

scale = 10^(dBChange/20); % Convert from decible to linear

out = scale*in;           % Apply linear amplitude to signal


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
