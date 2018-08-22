% BIQUADEXAMPLE
% This script demonstrates the use of the 
% bi-quad filter function. Various filter
% types and topologies can be tested.
%
% See also BIQUADFILTER

% Impulse Response of Bi-quad
x = [1;zeros(4095,1)];

% Filter Parameters
Fs = 48000;
f = 1000;    % Frequency in Hz
Q = 0.707;
dBGain = -6;

% FILTER TYPE >>> lpf,hpf,pkf,apf,nch,hsf,lsf,bp1,bp2
type = 'lpf'; 
% TOPOLOGY >>> 1 = Direct Form I, 2 = II, 3 = Transposed II
form = 3; 

y = biquadFilter(x,Fs,f,Q,dBGain,type,form);

% Plot Amplitude Response of Filter
[h,w] = freqz(y,1,4096,Fs);
semilogx(w,20*log10(abs(h)));axis([20 20000 -20 15]);
xlabel('Frequency (Hz)'); ylabel('Amplitude (dB)');

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

