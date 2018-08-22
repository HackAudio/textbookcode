% CUBICDISTORTION
% This function implements cubic soft-clipping
% distortion. An input parameter "a" is used 
% to control the amount of distortion applied 
% to the input signal.
%
% Input variables
%   in : input signal
%   a : drive amount (0-1), amplitude of 3rd harmonic
%
% See also ARCTANDISTORTION, DISTORTIONEXAMPLE

function [ out ] = cubicDistortion(in,a)

N = length(in);
out = zeros(N,1);
for n = 1:N
    
    out(n,1) = in(n,1) - a*(1/3)*in(n,1)^3;
    
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
