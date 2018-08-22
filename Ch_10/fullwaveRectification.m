% FULLWAVERECTIFICATION
% This function implements full-wave rectification
% distortion. Amplitude values of the input signal
% which are negative are changed to positive in the
% output signal.
%
% See also HALFWAVERECTIFICATION, DISTORTIONEXAMPLE

function [ out ] = fullwaveRectification(in)

N = length(in);
out = zeros(N,1);
for n = 1:N
   
    if in(n,1) >= 0 
        % If positive, assign input to output
        out(n,1) = in(n,1);
    else
        % If negative, flip input
        out(n,1) = -1*in(n,1);
        
    end
    
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
