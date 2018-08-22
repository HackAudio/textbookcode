% INFINITECLIP
% This function implements infinite clipping
% distortion. Amplitude values of the input signal
% which are positive are changed to 1 in the
% output signal. Amplitude values of the input signal
% which are negative are changed to -1 in the
% output signal.
%
% See also HARDCLIP, DISTORTIONEXAMPLE

function [out] = infiniteClip(in)

N = length(in);
out = zeros(N,1);
for n = 1:N
    % Change all amplitude values to +1 or -1 (FS amplitude)
    % "Pin the Rails" (description in audio electronics)
    if in(n,1) >= 0 
        % If positive, assign output = 1
        out(n,1) = 1;
    else
        % If negative, set output = -1
        out(n,1) = -1;
        
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
