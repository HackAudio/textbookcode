% AUDIOSPECGRAM
% This script displays a spectrogram of an audio signal
% using the built-in MATLAB function
%
% See also SPECTROGRAM

[x,Fs] = audioread('AcGtr.wav');

% Waveform
t = [0:length(x)-1].' * (1/Fs);
subplot(3,1,1);
plot(t,x); axis([0 length(x)*(1/Fs) -1 1]);

% Spectrogram 
nfft = 2048; % length of each time frame

window = hann(nfft); % calculated windowing function

overlap = 128; % Number of samples for frame overlap

% Use the built-in spectrogram function
[y,f,t,p] = spectrogram(x,window,overlap,nfft,Fs);

% Lower Subplot
subplot(3,1,2:3);
surf(t,f,10*log10(p),'EdgeColor','none');
% Rotate the spectrogram to look like a typical "audio" visualization
axis xy; axis tight; view(0,90);
xlabel('Time (sec.)');ylabel('Frequency (Hz)');

