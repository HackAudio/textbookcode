% This script compares the process of using a "for" loop
% with the process of using a "while" loop. The same
% result can be accomplished with each type loop by using
% the appropriate syntax.

% FOR Loop Example
N = 4;               % Number of elements for signal
sig1 = zeros(N,1);   % Initialize an output signal
for ii = 1:N
    sig1(ii) = sin(ii*pi/2);  % Fill the output array
                              % with values from the
end                           % sine function
sig1                 % Display result on Command Window

% WHILE Loop Example
sig2 = zeros(N,1);   % Initialize new output signal
jj = 1;              % Declare a counting variable
while jj <= N 
    sig2(jj) = sin(jj*pi/2);  % Fill the output array
    jj = jj + 1;              % Iterate counting variable
end
sig2                 % Display result on Command Window

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
