% FILTERBANKEXAMPLE
% This script creates a two-band filterbank using
% a LPF and HPF
%
% See also BUTTER

clear; clc;

Fs = 48000;
Nyq = Fs/2;
m = 2; % Filter Order

numOfBands = 4;

% Logarithmically spaced cut-off frequencies
% 2*10^1 - 2*10^4 (20-20k) Hz
freq = 2 * logspace(1,4,numOfBands+1);

for band = 1:numOfBands
   
    Wn = [freq(band) , freq(band+1)] ./ Nyq;
    [b(:,band),a(:,band)] = butter(m,Wn);
    
    [h,w] = freqz(b(:,band),a(:,band),4096,Fs);
    semilogx(w,20*log10(abs(h)));
    hold on;
    
end

hold off;
axis([20 20000 -24 6]);
xlabel('Frequency (Hz)');
ylabel('Amplitude (dB)');

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
