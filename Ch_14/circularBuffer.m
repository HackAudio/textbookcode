% CIRCULARBUFFER
% This function performs series delay and uses
% a circular buffer. Rather than shifting
% all the values in the array buffer during each
% iteration, the index changes each time through
% based on the current sample, "n"
%
% Additional input variables
%    delay : samples of delay
%    n : current sample number used for circular buffer

function [out,buffer] = circularBuffer(in,buffer,delay,n)

% Determine indexes for circular buffer
len = length(buffer);
indexC = mod(n-1,len) + 1; % Current index in circular buffer
indexD = mod(n-delay-1,len) + 1; % Delay index in circular buffer

out = buffer(indexD,1);
% Store the current output in appropriate index
buffer(indexC,1) = in;