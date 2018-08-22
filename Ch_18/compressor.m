% COMPRESSOR
% This function implements a dynamic range compressor 
% with separate attack and release times. To visualize
% the results, code is included at the end of the function
% to plot the input signal and the compressed output signal.
% As a default, this code is commented so it does not create
% a plot each time the function is called.
%
% Input Variables
%   T : threshold relative to 0 dBFS
%   R : ratio (R to 1)
%   attackTime : units of seconds
%   releaseTime : units of seconds
% 
% See also COMPRESSOREXAMPLE, BASICCOMP

function [y] = compressor(x,Fs,T,R,attackTime,releaseTime)
N = length(x);
y = zeros(N,1);
lin_A = zeros(N,1);

% Initialize separate attack and release times
alphaA = exp(-log(9)/(Fs * attackTime));
alphaR = exp(-log(9)/(Fs * releaseTime));

gainSmoothPrev = 0; % Initialize smoothing variable

% Loop over each sample to see if it is above thresh
for n = 1:N
    % Turn the input signal into a uni-polar signal on the dB scale
    x_uni = abs(x(n,1));
    x_dB = 20*log10(x_uni/1);
    % Ensure there are no values of negative infinity
    if x_dB < -96
        x_dB = -96;
    end
    
    % Static Characteristics
    if x_dB > T
        gainSC = T + (x_dB - T)/R; % Perform Downwards Compression
    else 
        gainSC = x_dB; % Do not perform compression 
    end
          
    gainChange_dB = gainSC - x_dB;
    
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
    
    % Update gainSmoothPrev used in the next sample of the loop
    gainSmoothPrev = gainSmooth;
end

% Uncomment for visualization
% t = [0:N-1]/Fs; t = t(:);
% subplot(2,1,1);
% plot(t,x); title('Input');axis([0 t(end) -1.1 1.1]); 
% subplot(2,1,2);
% plot(t,y,t,lin_A); title('Output'); axis([0 t(end) -1.1 1.1]);
% legend('Output Signal','Gain Reduction');


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



