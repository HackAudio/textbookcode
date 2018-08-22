% SINEANGLE
% This script demonstrates a method to synthesize
% sine waves by using an angle of rotation
%
% See also SINESYNTHESIS

clear;clc;
% Declare initial parameters
f = 2; % Frequency in Hz
phi = 0; % phase offset
Fs = 1000; % sampling rate
Ts = 1/Fs; % sample period
t = [0:Ts:1].'; % sample times

% Calculate Angle of Rotation
angleChange = f*Ts*2*pi;
currentAngle = phi;

N = length(t);
out = zeros(N,1);
% Update the value of the currentAngle each iteration
% through the loop
for n = 1:N
    
    out(n,1) = sin(currentAngle);
    % Update phase angle for next loop
    currentAngle = currentAngle + angleChange;
    
    if currentAngle > 2*pi % Ensure angle is not > 2*pi
        currentAngle = currentAngle - 2*pi;
    end
end


% Plot the synthesized signal
plot(t,out);
xlabel('Time (sec.)'); ylabel('Amplitude');
legend('out');

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
