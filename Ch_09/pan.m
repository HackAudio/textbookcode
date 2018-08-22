% PAN
% This function pans a mono audio signal in a stereo field.
% It is implemented such that it can pan the entire signal
% to one location if "panValue" is a scalar. It can also be
% used for auto-pan effects if "panValue" is an array.
%
% Input Variables
%   panType : 1=Linear, 2=sqRt, 3 = sine-law
%   panValue : (-100 to +100) transformed to a scale of (0-1)

function [out] = pan(in, panValue, panType)

% Convert Pan Value to a Normalized Scale
panTransform = (panValue/200) + 0.5;

%conditional statements determining panType
if panType == 1
    leftAmp = 1-panTransform;
    rightAmp = panTransform;
elseif panType == 2
    leftAmp = sqrt(1-panTransform);
    rightAmp = sqrt(panTransform);
elseif panType == 3
    leftAmp = sin((1-panTransform) * (pi/2));
    rightAmp = sin(panTransform * (pi/2));
    
end

leftChannel = leftAmp.*in;
rightChannel = rightAmp.*in;

out = [leftChannel,rightChannel];

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

