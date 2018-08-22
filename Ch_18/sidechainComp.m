% SIDECHAINCOMP
% This script creates a side-chain compressor with
% a synthesizer signal and kick drum signal. 
%
% See also COMPRESSOR
clear;clc;
% Synthesizer Input Signal
[x,Fs] = audioread('Synth.wav');
% Kick Drum for the Detection Path
[sc] = audioread('Kick.wav');

% Parameters for Compressor
T = -24;   % Threshold = -24 dBFS
R = 10;     % Ratio = 10:1

% Initialize separate attack and release times
attackTime = 0.05;  % time in seconds
alphaA = exp(-log(9)/(Fs * attackTime));
releaseTime = 0.25;  % time in seconds
alphaR = exp(-log(9)/(Fs * releaseTime));

gainSmoothPrev = 0; % Initialize smoothing variable

N = length(sc);
y = zeros(N,1);
lin_A = zeros(N,1);
% Loop over each sample to see if it is above thresh
for n = 1:N
    %%%%% Detection path based on the Kick Drum input signal
    % Turn the input signal into a uni-polar signal on the dB scale
    sc_uni = abs(sc(n,1));
    sc_dB = 20*log10(sc_uni/1);
    % Ensure there are no values of negative infinity
    if sc_dB < -96
        sc_dB = -96;
    end
    
    % Static Characteristics
    if sc_dB > T
        gainSC = T + (sc_dB - T)/R; % Perform Downwards Compression
    else 
        gainSC = sc_dB; % Do not perform compression 
    end
          
    gainChange_dB = gainSC - sc_dB;
    
    % smooth over the gainChange
    if gainChange_dB < gainSmoothPrev
        % attack mode
        gainSmooth = ((1-alphaA)*gainChange_dB) ...
            +(alphaA*gainSmoothPrev);
    else
        % release
        gainSmooth = ((1-alphaR)*gainChange_dB) ...
            +(alphaR*gainSmoothPrev);
    end

    % Convert to linear amplitude scalar
    lin_A(n,1) = 10^(gainSmooth/20);
    
    % Apply linear amplitude to synthesizer input sample
    y(n,1) = lin_A(n,1) * x(n,1);
    
    % Update gainSmoothPrev used in the next sample of the loop
    gainSmoothPrev = gainSmooth;
end
t = [0:N-1]/Fs; t = t(:);

subplot(3,1,1);
plot(t,x); title('Input Signal - Synth');axis([0 t(end) -1.1 1.1]); 
subplot(3,1,2);
plot(t,sc); title('Sidechain - Kick');axis([0 t(end) -1.1 1.1]);
subplot(3,1,3);
plot(t,y,t,lin_A); title('Output'); axis([0 t(end) -1.1 1.1]);
legend('Output Signal','Gain Reduction');

sound(y,Fs);

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

