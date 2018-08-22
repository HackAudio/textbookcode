% ADDITIONEXAMPLE
% This script provides two examples for combining 
% signals together using addition
%
% This first example is for signals of the 
% same frequency and phase
%
% The second example is for signals of different frequencies
%
% See also SUBTRACTIONEXAMPLE

% Example 1 - Same Frequencies
% Declare initial parameters
f = 1; 
a = 1;
phi = 0;
Fs = 100;
t = [0:1/Fs:1].';
sw1 = a * sin(2*pi*f.*t+phi);
sw2 = a * sin(2*pi*f.*t+phi);
N = length(sw1);
sw3 = zeros(N,1);
% Loop through arrays to perform element-wise addition
for n = 1:N
    sw3(n,1) = sw1(n,1)+sw2(n,1);
end
% Plot the result
plot(t,sw1,'--',t,sw2,'o',t,sw3);
xlabel('Time (sec.)');
ylabel('Amplitude');
title('Addition of 2 Sine Waves - Same Frequencies');
legend('SW1','SW2','SW1+SW2');

% Example 2 - Different Frequencies
% Declare initial parameters
f = 1; 
a = 1;
phi = 0;
Fs = 100;
t = 0:1/Fs:1;
sw1 = a * sin(2*pi*f.*t+phi);
sw2 = a * sin(2*pi*(f*2).*t+phi); % Change frequency x2
% Addition of arrays in MATLAB is element-wise by default
sw3 = sw1+sw2;
    
figure; % Create a new figure window
plot(t,sw1,'--',t,sw2,'.',t,sw3);
xlabel('Time (sec.)');
ylabel('Amplitude');
title('Addition of 2 Sine Waves - Different Frequencies');
legend('SW1','SW2','SW1+SW2');

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
