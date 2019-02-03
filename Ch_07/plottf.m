%PLOTTF Plot sampled signal in time and frequency domains
%   PLOTTF(x,Fs) plots the time-domain samples in vector x, assuming that 
%   Fs is an audio sampling rate (44.1k, 48k, etc.) in samples/second, 
%   and also plots the the Fourier transform on the decibel scale
%   between the frequencies of 20 Hz and 20 kHz, logarithmically spaced.
%
% See also PLOT

function plottf(x,Fs)
Ts = 1/Fs;
N = length(x);
t = [0:N-1]*Ts; t=t(:);

subplot(2,1,1);
plot(t,x); xlabel('Time (sec.)'); ylabel('Amplitude');

% Fourier Transform
len = N;
if len < 4096
    len = 4096;
end
X=(2/N)*fft(x,len);        % do DFT/FFT

f= [0:len-1]*(Fs/len);

% Ensure there will be no values of -Inf dB
% by making the minimum value = -120 dB
X(abs(X)<0.000001) = 0.000001;

subplot(2,1,2);
semilogx(f,20*log10(abs(X))); axis([20 20000 -60 4]);
ax = gca; ax.XTick =[20 50 100 200 500 1000 2000 5000 10000 20000];
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

