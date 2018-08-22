% BANDSTOPFILTER
% This script creates a band-stop filter by performing
% parallel processing with a LPF and HPF
%
% See also FIR1

% Design Filters
% Note: W_lpf must be less than W_hpf to 
% create a band-stop filter
order = 24;
W_lpf = 0.25;    % Normalized freq of LPF
lpf = fir1(order,W_lpf);

W_hpf = 0.75;    % Normalized freq of HPF
hpf = fir1(order,W_hpf,'high');

% Impulse Input Signal
input = [1, 0];

% Separately, find impulse response of LPF and HPF
u = conv(input,lpf);

w = conv(input,hpf);

% Create combined parallel output by adding together IRs
output = u + w; 

% Plot the frequency response
freqz(output);

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
