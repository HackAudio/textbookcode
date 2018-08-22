% FDNEXAMPLE
% This script implements a feed-back delay network
% using a Stautner and Puckette matrix.
%
% See also MODDELAY
clear;clc;

[in,Fs] = audioread('AcGtr.wav');
% Add extra space at end for the reverb tail
in = [in;zeros(Fs*3,1)]; 

% Max delay of 70 ms
maxDelay = ceil(.07*Fs);  
% Initialize all buffers
buffer1 = zeros(maxDelay,1); buffer2 = zeros(maxDelay,1); 
buffer3 = zeros(maxDelay,1); buffer4 = zeros(maxDelay,1);  

% Delay and Gain Parameters
d1 = fix(.0297*Fs); 
d2 = fix(.0371*Fs); 
d3 = fix(.0411*Fs); 
d4 = fix(.0437*Fs); 
g11 = 0; g12 = 1; g13 = 1; g14 = 0;  % Stautner and Puckette
g21 =-1; g22 = 0; g23 = 0; g24 =-1;  % Feed-back Matrix
g31 = 1; g32 = 0; g33 = 0; g34 =-1;
g41 = 0; g42 = 1; g43 =-1; g44 = 0;

% LFO parameters
rate1 = 0.6; amp1 = 5; 
rate2 = 0.71; amp2 = 5;
rate3 = 0.83; amp3 = 5; 
rate4 = 0.95; amp4 = 5;

% Initialize Output Signal
N = length(in);
out = zeros(N,1);

% Feed-back holding variables
fb1 = 0; fb2 = 0; fb3 = 0; fb4 = 0;

% Gain to control reverb time
g = .67;
for n = 1:N
    
    % Combine input with feed-back for respective delay lines 
    inDL1 = in(n,1) + fb1;
    inDL2 = in(n,1) + fb2;
    inDL3 = in(n,1) + fb3;
    inDL4 = in(n,1) + fb4;
    
    % Four Parallel Delay Lines
    [outDL1,buffer1] = modDelay(inDL1,buffer1,Fs,n,...
    d1,amp1,rate1);
    
    [outDL2,buffer2] = modDelay(inDL2,buffer2,Fs,n,...
    d2,amp2,rate2);

    [outDL3,buffer3] = modDelay(inDL3,buffer3,Fs,n,...
    d3,amp3,rate3);
    
    [outDL4,buffer4] = modDelay(inDL4,buffer4,Fs,n,...
    d4,amp4,rate4);
    
    % Combine parallel paths
    out(n,1) = 0.25*(outDL1 + outDL2 + outDL3 + outDL4);
    
    % Calculate Feed-back (including cross-over)
    fb1 = g*(g11*outDL1 + g21*outDL2 + g31*outDL3 + g41*outDL4);
    fb2 = g*(g12*outDL1 + g22*outDL2 + g32*outDL3 + g42*outDL4);
    fb3 = g*(g13*outDL1 + g23*outDL2 + g33*outDL3 + g43*outDL4);
    fb4 = g*(g14*outDL1 + g24*outDL2 + g34*outDL3 + g44*outDL4);
    
end
sound(out,Fs);

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
