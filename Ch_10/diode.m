% DIODE
% This function implements the Shockley
% Ideal Diode Equation for audio signals
% with an amplitude between -1 to 1 FS
%
% See also ASYMMETRICAL, DISTORTIONEXAMPLE

function [out] = diode(in)

% Diode Characteristics
Vt = 0.0253; % thermal voltage
eta = 1.68; % emission coefficient
Is = .105;  % saturation current

N = length(in);
out = zeros(N,1);

for n = 1:N
    
    out(n,1) = Is * (exp(0.1*in(n,1)/(eta*Vt)) - 1);
    
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
