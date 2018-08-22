% FEEDBACKCOMP
% This script creates a feed-back compressor.
% The processing of the detection path is similar
% to the feed-forward compressor. The main difference
% is the output, "y" is analyzed in the detection 
% path, not the input "x". A plot is produced
% at the end of the script to visualize the result.
%
% See also COMPRESSOR, BASICCOMP

% Acoustic Guitar "Audio" Sound file
[x,Fs] = audioread('AcGtr.wav');

% Parameters for Compressor
T = -15;   % Threshold = -15 dBFS
R = 10;     % Ratio = 10:1

% Initialize separate attack and release times
attackTime = 0.05;  % time in seconds
alphaA = exp(-log(9)/(Fs * attackTime));
releaseTime = 0.25;  % time in seconds
alphaR = exp(-log(9)/(Fs * releaseTime));

gainSmoothPrev = 0; % Initialize smoothing variable

y_prev = 0; % Initialize output for feed-back detection

N = length(x);
y = zeros(N,1);
lin_A = zeros(N,1);
% Loop over each sample to see if it is above thresh
for n = 1:N
    %%%%% Detection path based on the output signal, not "x"
    % Turn the input signal into a uni-polar signal on the dB scale
    y_uni = abs(y_prev);
    y_dB = 20*log10(y_uni/1);
    
    % Ensure there are no values of negative infinity
    if y_dB < -96
        y_dB = -96;
    end
    
    % Static Characteristics
    if y_dB > T
        gainSC = T + (y_dB - T)/R; % Perform Downwards Compression
    else 
        gainSC = y_dB; % Do not perform compression 
    end
          
    gainChange_dB = gainSC - y_dB;
    
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
    
    % Apply linear amplitude to input sample
    y(n,1) = lin_A(n,1) * x(n,1);
    y_prev = y(n,1); % Update for next cycle
    
    % Update gainSmoothPrev used in the next sample of the loop
    gainSmoothPrev = gainSmooth;
    
end
t = [0:N-1]/Fs; t = t(:);

subplot(2,1,1);
plot(t,x); title('Input Signal');axis([0 7 -1.1 1.1]); 
subplot(2,1,2);
plot(t,y,t,lin_A); title('Output'); axis([0 7 -1.1 1.1]);
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




