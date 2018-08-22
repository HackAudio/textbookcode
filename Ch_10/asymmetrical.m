% ASYMMETRICAL
% This function creates a distortion effect
% which is neither "even" or "odd". Therefore,
% the resulting signal has both even and 
% odd harmonics.
%
% Input variables
%   in : input signal
%   dc : offset amount
%
% See also CUBICDISTORTION, DISTORTIONEXAMPLE

function out = asymmetrical(in,dc)
N = length(in);
x = in + dc; % Introduce DC Offset
y = zeros(N,1);

for n = 1:N
    % Conditional to ensure "out" is a 
    % monotonically increasing function
    if abs(x(n,1)) > 1
        x(n,1) = sign(x(n,1));
    end
    
    % Non-linear, distortion function
    y(n,1) = x(n,1) - (1/5)*x(n,1)^5;
    
end
out = y - dc; % Remove DC Offset

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
