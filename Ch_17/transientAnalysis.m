% TRANSIENTANALYSIS
% This script plots the amplitude envelopes used
% in the transient designer effect. A comparison
% is plotted of the "fast" and "slow" envelopes
% used to determine when "attack" and "sustain"
% is occurring in the signal.
%
% See also TRANSIENTDESIGNER, TRANSIENTEXAMPLE
clear; clc;

[in,Fs]=audioread('AcGtr.wav');

gFast = 0.9991; % Gain smoothing for the "fast" envelope
fbFast = 0;     % Feed-back for the "fast" envelope
gSlow = 0.9999; % Gain smoothing for the "slow" envelope 
fbSlow = 0;     % Feed-back for the "slow" envelope    
N = length(in);
envFast = zeros(N,1);
envSlow = zeros(N,1);
transientShaper = zeros(N,1);
for n = 1:N
    
    envFast(n,1) = (1-gFast) * 2 * abs(in(n,1)) + gFast * fbFast;
    fbFast = envFast(n,1);
    
    envSlow(n,1) = (1-gSlow) * 3 * abs(in(n,1)) + gSlow * fbSlow;
    fbSlow = envSlow(n,1);
    
    transientShaper(n,1) = envFast(n,1) - envSlow(n,1);
    
end

figure(1);
plot(envFast); hold on;
plot(envSlow); 
plot(transientShaper);
hold off;
legend({'$\alpha$ = 0.9991','$\alpha$ = 0.9999', ...
    'envFast - envSlow'},'Interpreter','latex','FontSize',14);
axis([1 length(in) -0.5 1]);

attack = zeros(N,1);
sustain = zeros(N,1);
for n = 1:N
   
    if transientShaper(n,1) > 0
        
        attack(n,1) = transientShaper(n,1) + 1;
        sustain(n,1) = 1;
    else
        
        attack(n,1) = 1;
        sustain(n,1) = transientShaper(n,1) + 1;
        
    end
    
end

figure(2);
subplot(2,1,1);  % Plot the detected attack envelope
plot(attack); title('Attack Envelope', 'FontSize',14);
axis([1 length(in) 0.5 1.5]);
subplot(2,1,2);  % Plot the detected sustain envelope
plot(sustain); title('Sustain Envelope', 'FontSize',14);
axis([1 length(in) 0.5 1.5]);

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
