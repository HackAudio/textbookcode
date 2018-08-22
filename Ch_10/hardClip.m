% HARDCLIP
% This function implements hard-clipping
% distortion. Amplitude values of the input signal
% which are greater than a threshold are clipped.
%
% Input Variables
%   in : signal to be processed
%   thresh : maximum amplitude where clipping occurs
%
% See also INFINITECLIP, PIECEWISE, DISTORTIONEXAMPLE

function [out] = hardClip(in,thresh)

N = length(in);
out = zeros(N,1);
for n = 1:N
   
    if in(n,1) >= thresh 
        % If true, assign output = thresh
        out(n,1) = thresh;
    elseif in(n,1) <= -thresh
        % If true, set output = -thresh
        out(n,1) = -thresh;
    else
        out(n,1) = in(n,1);
        
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
