% FEEDBACKDELAY
% This function performs feed-back delay by processing an
% individual input sample and updating a delay buffer
% used in a loop to index each sample in a signal
%
% Additional input variables
%       delay : samples of delay
%       fbGain : feed-back gain (linear scale)

function [out,buffer] = feedbackDelay(in,buffer,delay,fbGain)

out = in + fbGain*buffer(delay,1);

% Store the current output in appropriate index
buffer = [out ; buffer(1:end-1,1)];



