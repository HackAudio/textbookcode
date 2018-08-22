% PINKNOISE1
% This script synthesizes an approximation of pink noise
% using an FIR filter.
%
% Pink noise can be created by filtering white noise. The
% amplitude response of the filter has a gain of 1/sqrt(f),
% where "f" is frequency (Hz).
%
% See also FIR2

clc; clear; 
Fs = 48000;     % Sampling rate
Nyq = Fs/2;     % Nyquist Frequency for Normalization
sec = 5;        % 5 seconds of noise
white = randn(sec*Fs,1);


f = 20;    % Starting frequency in Hz
gain = 1/sqrt(f);  % Amplitude at starting frequency

freq = 0;  % Initialize fir2 freq vector  
while f < Nyq
    % Normalized Frequency Vector
    freq = [freq f/Nyq];
    
    % Amplitude vector, gain = 1/sqrt(f)
    gain = [gain 1/sqrt(f)];
    
    % Increase "f" by an octave
    f = f*2;
end
% Set frequency and amplitude at nyquist
freq = [freq 1];
gain = [gain 1/sqrt(Nyq)];

% Filter Normalization Factor to Unity Gain
unity = sqrt(20);
gain = unity * gain;

% Plot Frequency Reponse of Filter
order = 2000;
h = fir2(order,freq,gain);
[H,F] = freqz(h,1,4096,Fs);
semilogx(F,20*log10(abs(H))); axis([20 20000 -30 0]);

% Create Pink Noise by Filtering White Noise
pink = conv(white,h);
sound(pink,Fs);

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
