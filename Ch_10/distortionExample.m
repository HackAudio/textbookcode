% DISTORTIONEXAMPLE
% This script is used to test various distortion functions.
% Each algorithm can be analyzed by "uncommenting" the
% code under each section. The waveform, characteristic curve,
% and total-harmonic distortion (THD) is plotted for 
% each function.
%
% See also THDEXAMPLE

clear;clc;

Fs = 48000; Ts = 1/Fs;
f = 2;       % f = 2 (Waveform and Char Curve), f = 2500 (THD)
t = [0:Ts:1].';
in = sin(2*pi*f*t);  % Used as input signal for each distortion

%%% Infinite Clipping
%out = infiniteClip(in);

%%% Half-wave Rectification
%out = halfwaveRectification(in);

%%% Full-wave Rectification
%out = fullwaveRectification(in);

%%% Hard-clipping
%thresh = 0.5;
%out = hardClip(in,thresh);

%%% Cubic soft-clipping
%a = 1;  % Amount: 0 (no distortion) - 1 (full)
%out = cubicDistortion(in,a);

%%% Arctangent Distortion
%alpha = 5;
%out = arctanDistortion(in,alpha);

%%% Sine Distortion
%out = sin((pi/2)*in);

%%% Exponential Soft-clipping
%G = 4;
%out = exponential(in,G);

%%% Piece-wise Overdrive
%out = piecewise(in);

% Diode Clipping
%out = diode(in);

% Asymmetrical Distortion
%dc = -0.25;
%out = asymmetrical(in,dc);

%%% Bit Crushing
%nBits = 8;
%out = bitReduct(in,nBits);
    
%%% Dither noise
dither = 0.02*randn(size(in));
nBits = 4;
out = bitReduct(in+dither,nBits);

%%% Plotting
figure(1);   % Use f = 2 (above)
subplot(1,2,1); % Waveform
plot(t,in,t,out); axis([0 1 -1.1 1.1]);
xlabel('Time (sec.)');ylabel('Amplitude');
title('Waveform');

subplot(1,2,2); % Characteristic Curve
plot(in,in,in,out); axis([-1 1 -1.1 1.1]);
xlabel('Input Amplitude'); ylabel('Output Amplitude');
legend('Linear','Distortion'); title('Characteristic Curve');


figure(2); % Total Harmonic Distortion Plot (f = 2500)
thd(out,Fs,5);
axis([0 24 -50 0]);

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

