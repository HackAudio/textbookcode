% EXPANDER
% This function implements an expander/gate DR processor.
% A similar approach is used to a compressor, except
% the static characteristics are calculated differently.
%
% Input Variables
%   T : threshold relative to 0 dBFS
%   R : ratio (R to 1)
%   attackTime : units of seconds
%   releaseTime : units of seconds
%
% See also EXPANDER, COMPRESSOREXAMPLE
function [y] = expander(x,Fs,T,R,attackTime,releaseTime)
N = length(x);
y = zeros(N,1);
lin_A = zeros(N,1);

% Calculate separate attack and release times
alphaA = exp(-log(9)/(Fs * attackTime));
alphaR = exp(-log(9)/(Fs * releaseTime));

gainSmoothPrev = -144; % Initialize smoothing variable

% Loop over each sample to see if it is below thresh
for n = 1:N
    % Turn the input signal into a uni-polar signal on the dB scale
    x_uni = abs(x(n,1));
    x_dB = 20*log10(x_uni/1);
    % Ensure there are no values of negative infinity
    if x_dB < -144
        x_dB = -144;
    end
    
    % Static Characteristics
    if x_dB > T
        gainSC = x_dB; % Do not perform expansion
    else
        % Expander Calculation
        gainSC = T + (x_dB - T)*R ; % Perform Downwards Expansion
        
        % Gating (Use Instead of Expander)
        %gainSC = -144;
    end
          
    gainChange_dB = gainSC - x_dB;
    
    % smooth over the gainChange
    if gainChange_dB > gainSmoothPrev
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
t = [0:N-1]/Fs; t = t(:);

subplot(2,1,1);
plot(t,x); title('Input Signal');axis([0 14 -1.1 1.1]); 
subplot(2,1,2);
plot(t,y,t,lin_A); title('Output'); axis([0 14 -1.1 1.1]);
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





