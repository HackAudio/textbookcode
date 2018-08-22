% STEPRESPONSE
% This script demonstrates the built-in,
% MATLAB function: stepz(b,a). The step 
% response for several first-order systems
% is compared using different feed-back gains.
%
% See also STEPZ

Fs = 48000; % Initialize the Sampling Rate
sec = 1;   % Time length in seconds
n = sec*Fs; % Convert seconds to # of samples

% Define different gain values to test
gains = [0.999;0.9995;0.9997;0.9999];

% Determine a new step response each time through the loop
for element = 1:length(gains) 
    alpha = gains(element,1);
    b = [(1-alpha)];
    a = [1 , -alpha];
    [h,t] = stepz(b,a,n,Fs);
    plot(t,h);hold on;
end

hold off; axis([0 sec -0.1 1.1]); xlabel('Time (sec.)');
AX = legend('.9990','.9995','.9997','.9999');set(AX,'FontSize',12);

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

