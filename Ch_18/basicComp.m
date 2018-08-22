% BASICCOMP
% This script creates a dynamic range compressor with
% attack and release times linked together. A step
% input signal is synthesized for testing. A plot
% is produced at the end of the script to show
% a comparison of the input step signal, the output
% response, and the gain reduction curve.
%
% See also COMPRESSOR, COMPRESSOREXAMPLE

% Step Input Signal
Fs = 48000; Ts = 1/Fs;
x = [zeros(Fs,1); ones(Fs,1); zeros(Fs,1)]; 
N = length(x);
% Parameters for Compressor
T = -12;   % Threshold = -12 dBFS
R = 3;     % Ratio = 3:1
responseTime = 0.25;  % time in seconds
alpha = exp(-log(9)/(Fs * responseTime));
gainSmoothPrev = 0; % Initialize smoothing variable

y = zeros(N,1);
lin_A = zeros(N,1);
% Loop over each sample to see if it is above thresh
for n = 1:N
    %%%%%% Calculations of the Detection Path
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
    
    % smooth over the gainChange_dB to alter Response Time
    gainSmooth =  ((1-alpha)*gainChange_dB) + (alpha*gainSmoothPrev);

    % Convert to linear amplitude scalar
    lin_A(n,1) = 10^(gainSmooth/20);
    
    %%%%%% Apply linear amplitude from Detection Path
    %%%%%% to input sample
    y(n,1) = lin_A(n,1) * x(n,1);
    
    % Update gainSmoothPrev used in the next sample of the loop
    gainSmoothPrev = gainSmooth;
end
t = [0:N-1]*Ts; t = t(:);

subplot(3,1,1);
plot(t,x); title('Step Input');axis([0 3 -0.1 1.1]); 
subplot(3,1,2);
plot(t,y); title('Comp Out'); axis([0 3 -0.1 1.1]);
subplot(3,1,3);
plot(t,lin_A); title('Gain Reduction');axis([0 3 -0.1 1.1]);
% The "gain reduction" line shows the amount of compression
% applied at each sample of the signal. When the value
% is "1", there is no compression. When the value is less
% than "1", gain reduction is happening.

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




