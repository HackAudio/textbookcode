% PIECEWISE
% This function implements a piecewise distortion
% algorithm. Within one operating region, the 
% input signal is not distorted. When the signal
% is outside of that operating region, it is clipped.
%
% See also HARDCLIP, DISTORTIONEXAMPLE

function [ out ] = piecewise(in)

out = zeros(size(in));

for n = 1:length(in)
    if abs(in(n,1)) <= 1/3
        out(n,1) = 2*in(n,1);
    elseif abs(in(n,1)) > 2/3 
        out(n,1) = sign(in(n,1));
    else
        out(n,1) = sign(in(n,1))*(3-(2-3*abs(in(n,1)))^2)/3;
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
