% CROSSOVERFEEDBACK
% This script implements two comb filters with
% crossover feedback
%
% See also MODDELAY
clear;clc;

Fs = 48000;
in = [1 ; zeros(Fs*0.5,1)];

% Max delay of 70 ms
maxDelay = ceil(.07*Fs);  
% Initialize all buffers
buffer1 = zeros(maxDelay,1); buffer2 = zeros(maxDelay,1);  

% Delay and Gain Parameters
d1 = fix(.0297*Fs); 
d2 = fix(.0419*Fs); 
g11 = -0.75; g12 = -0.75;
g21 = -0.75; g22 = -0.75;

% LFO parameters
rate1 = 0.6; amp1 = 3; 
rate2 = 0.71; amp2 = 3;

% Initialize Output Signal
N = length(in);
out = zeros(N,1);

fb1 = 0; fb2 = 0; % Feed-back holding variables

for n = 1:N
    
    % Combine input with feed-back for respective delay lines 
    inDL1 = in(n,1) + fb1;
    inDL2 = in(n,1) + fb2;
    
    % Two Parallel Delay Lines
    
    [outDL1,buffer1] = modDelay(inDL1,buffer1,Fs,n,...
    d1,amp1,rate1);
    
    [outDL2,buffer2] = modDelay(inDL2,buffer2,Fs,n,...
    d2,amp2,rate2);
    
    % Combine parallel paths
    out(n,1) = 0.5*(outDL1 + outDL2);
    
    % Calculate Feed-back (including crossover)
    fb1 = 0.5*(g11 * outDL1 + g21 * outDL2);
    fb2 = 0.5*(g12 * outDL1 + g22 * outDL2);
    
end
plot(out);

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
