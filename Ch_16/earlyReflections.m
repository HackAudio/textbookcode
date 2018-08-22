% EARLYREFLECTIONS
% This function creates a tapped delay line to 
% be used for the Early Reflections of a reverb algorithm.
% The delays and gains of the taps are included in this 
% function, and were based on an IR measurement from a 
% recording studio in Nashville, TN. 
%
% See also MOORERREVERB

function [out,buffer] = earlyReflections(in,buffer,Fs,n)

% Delay times converted from milliseconds
delayTimes = fix(Fs*[0; 0.01277; 0.01283; 0.01293; 0.01333;...
    0.01566; 0.02404; 0.02679; 0.02731; 0.02737; 0.02914; ...
    0.02920; 0.02981; 0.03389; 0.04518; 0.04522; ...
    0.04527; 0.05452; 0.06958]);
            
% There must be a "gain" for each of the "delayTimes"
gains = [1; 0.1526; -0.4097; 0.2984; 0.1553; 0.1442;...
    -0.3124; -0.4176; -0.9391; 0.6926; -0.5787; 0.5782; ...
     0.4206; 0.3958; 0.3450; -0.5361; 0.417; 0.1948; 0.1548];          

% Determine indexes for circular buffer
len = length(buffer);
indexC = mod(n-1,len) + 1; % Current index 
buffer(indexC,1) = in;

out = 0; % Initialize the output to be used in loop

% Loop through all the taps
for tap = 1:length(delayTimes)
    % Find the circular buffer index for the current tap
    indexTDL = mod(n-delayTimes(tap,1)-1,len) + 1;  
   
    % "Tap" the delay line and add current tap with output
    out = out + gains(tap,1) * buffer(indexTDL,1);
    
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




