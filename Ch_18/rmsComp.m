% RMSCOMP
% This script creates a compressor with 
% conventional RMS detection. The RMS value
% is calculated over a range of "M" samples.
% Note: attack and release are linked
%
% See also COMPRESSOR, RMSCOMP2
clear;clc;close all;

% Acoustic Guitar "Audio" Sound file
[x,Fs] = audioread('AcGtr.wav');

% Parameters for Compressor
T = -20;   % Threshold = -20 dBFS
R = 4;     % Ratio = 4:1

% Initialize separate attack and release times
attackTime = 0.1;  % time in seconds
alphaA = exp(-log(9)/(Fs * attackTime));
releaseTime = 0.25;  % time in seconds
alphaR = exp(-log(9)/(Fs * releaseTime));

gainSmoothPrev = 0; % Initialize smoothing variable

M = 2048; % length of RMS calculation

% Initialize the first time window in a buffer
x_win = [zeros(M/2,1);x(1:(M/2),1)];

N = length(x);
y = zeros(N,1);
lin_A = zeros(N,1);

% Loop over each sample to see if it is above thresh
for n = 1:N
    
    % Calculate the RMS for the current window
    x_rms = sqrt(mean(x_win.^2));
    
    % Turn the input signal into a uni-polar signal on the dB scale
    x_dB = 20*log10(x_rms);
    
    % Ensure there are no values of negative infinity
    if x_dB < -96
        x_dB = -96;
    end
    
    % Static Characteristics
    if x_dB > T
        gainSC = T + (x_dB - T)/R; % Perform compression
    else 
        gainSC = x_dB; % Do not perform compression 
    end
          
    gainChange_dB = gainSC - x_dB;
    
    % Convert to linear amplitude scalar
    lin_A(n,1) = 10^(gainChange_dB/20);
    
    % Apply linear amplitude to input sample
    y(n,1) = lin_A(n,1) * x(n,1);
    
    
    % Update the current time window
    if n+(M/2) < N
        x_win = [x_win(2:end,1) ; x(n+(M/2)+1,1)];
    else
        x_win = [x_win(2:end,1) ; 0];
    end
end
t = [0:N-1]/Fs; t = t(:);

subplot(2,1,1);
plot(t,x); title('Input Signal');axis([0 t(end) -1.1 1.1]); 
subplot(2,1,2);
plot(t,y,t,lin_A); title('Output'); axis([0 t(end) -1.1 1.1]);
legend('Output Signal','Gain Reduction');


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



