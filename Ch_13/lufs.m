% LUFS
% This function calculates the loudness of a mono or stereo
% audio signal based on the LUFS/LKFS standard. The analysis
% involves multiple steps. First, the input signal is
% processed using the pre-filter followed by the RLB filter.
% Then a mean-square calculation is performed. Finally,
% all the channels are summed together and loudness is 
% converted to units of decibels (dB).
%
% See also LUFSEXAMPLE

function [loudness] = lufs(x)
% Number of samples
N = length(x);
% Determine whether mono or stereo
numOfChannels = size(x,2);

% Initialize Pre-filter
b0 = 1.53512485958697;
a1 = -1.69065929318241;
b1 = -2.69169618940638;
a2 = 0.73248077421585;
b2 = 1.19839281085285;
a0 = 1;

b = [b0, b1,b2];
a = [a0,a1,a2];

% Perform Pre-filtering
w = zeros(size(x));
for channel = 1:numOfChannels % Loop in case it is stereo
    w(:,channel) = filter(b,a,x(:,channel));
end

% RLB Filter
b0 = 1.0;
a1 = -1.99004745483398; 
b1 = -2.0;
a2 = 0.99007225036621;
b2 = 1.0;
a0 = 1;
b = [b0, b1,b2];
a = [a0,a1,a2];


% Perform RLB Filtering
y = zeros(size(x));
for channel = 1:numOfChannels
    y(:,channel) = filter(b,a,w(:,channel));
end


% Perform Mean-square Amplitude Analysis
z = zeros(1,numOfChannels);
for channel = 1:numOfChannels
    % Add together the square of the samples, 
    % then divide by the number of samples
    z(1,channel) = sum(y(:,channel).^2)/N;
end

% Determine loudness (dB) by summing all channels
loudness = -0.691 + 10 * log10(sum(z));

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
