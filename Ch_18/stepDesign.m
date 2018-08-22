% STEPDESIGN
% This function can be used to design a second-order
% system with specified step response characteristics.
%
% Input Variables
%   Fs : sampling rate
%   OS : percent overshoot
%   T : time in seconds of "characteristic"
%   characteristic : 'pk' (peak) or 'ss' (settling time)

function [b,a] = stepDesign(Fs,OS,T,characteristic)

if OS < 0.00001 % Ensure a minimum value of Overshoot
    OS = 0.00001;
end

% Convert Percent OverShoot to Damping
L = -log(OS/100)/(sqrt(pi^2 + (log(OS/100))^2));

% Find 'wn' - undamped natural frequency
% based on characteristic type 
if strcmp('pk',characteristic) 
    % Peak Time
    wn = pi/(T*sqrt(1-L^2));

elseif strcmp('st',characteristic) 
    %Setting Time (0.02 of steady-state)
    wn = -log(0.02*sqrt(1-L^2))/(L*T);
else
   % Return invalid type 
   disp('Please enter a chacteristic, "pk"-peak, "st"-settling time');
   return;
end

% Continuous Filter:
%
%                (wn)^2
% H(s) = ------------------------
%         s^2 + 2*L*wn + (wn)^2
%

num = wn^2;
den = [1 2*L*wn wn^2];

% Perform bilinear transform on continuous system
% to find discrete system
[b,a] = bilinear(num,den,Fs);

% Plot the step response
%n = 2*Fs; % number of seconds
%[h,t] = stepz(b,a,n,Fs);
%plot(t,h);
%phi = atan(L/(sqrt(1-L^2)));
%yStep = 1- exp(-L*wn*t) .* cos(wn*sqrt(1-L^2)*t - phi)/(sqrt(1-L^2));
%figure;
%plot(t,yStep);

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
