% BASICFILTERBANK
% This script creates a two-band filterbank using
% a LPF and HPF. The butterworth filter design
% function is used to create the LPF and HPF,
% both with the same cut-off frequency.
% The magnitude response of each filter is 
% plotted together.
% 
% See also BUTTER, FREQZ

Fs = 48000;
Nyq = Fs/2;
n = 8;
Wn = 1000/Nyq;

[bLow,aLow] = butter(n,Wn);
[bHi,aHi] = butter(n,Wn,'high');

[hLow,w] = freqz(bLow,aLow,4096,Fs);
[hHi] = freqz(bHi,aHi,4096,Fs);

semilogx(w,20*log10(abs(hLow)),w,20*log10(abs(hHi)));
axis([20 20000 -24 6]);
xlabel('Frequency (Hz)');
ylabel('Amplitude (dB)');
legend('LPF','HPF');

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
