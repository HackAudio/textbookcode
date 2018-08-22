% BIQUADFILTER
% This function implements a bi-quad filter based
% on the Audio EQ Cookbook Coefficients. All filter
% types can be specified (LPF, HPF, BPF, etc.) and
% three different topologies are included.
%
% Input Variables
%   f0 : filter frequency (cut-off or center based on filter)
%   Q : bandwidth parameter 
%   dBGain : gain value on the decibel scale
%   type : 'lpf','hpf','pkf','bp1','bp2','apf','lsf','hsf'
%   form : 1 (Direct Form I), 2 (DFII), 3 (Transposed DFII)

function [out] = biquadFilter(in,Fs,f0,Q,dBGain,type,form)

%%% Initial Parameters
N = length(in);
out = zeros(length(in),1);

%%% Intermediate Variables
%
w0 = 2*pi*f0/Fs;            % Angular Freq. (Radians/sample) 
alpha = sin(w0)/(2*Q);      % Filter Width
A  = sqrt(10^(dBGain/20));  % Amplitude

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% TYPE - LPF,HPF,BPF,APF,HSF,LSF,PKF,NCH
%
%----------------------
%        LPF
%----------------------
if strcmp(type,'lpf')
    b0 =  (1 - cos(w0))/2;
    b1 =   1 - cos(w0);
    b2 =  (1 - cos(w0))/2;
    a0 =   1 + alpha;
    a1 =  -2*cos(w0);
    a2 =   1 - alpha;

%----------------------
%        HPF
%----------------------
elseif strcmp(type,'hpf')
    b0 =  (1 + cos(w0))/2;
    b1 = -(1 + cos(w0));
    b2 =  (1 + cos(w0))/2;
    a0 =   1 + alpha;
    a1 =  -2*cos(w0);
    a2 =   1 - alpha;

%----------------------
%   Peaking Filter
%----------------------
elseif strcmp(type,'pkf')
    b0 =   1 + alpha*A;
    b1 =  -2*cos(w0);
    b2 =   1 - alpha*A;
    a0 =   1 + alpha/A;
    a1 =  -2*cos(w0);
    a2 =   1 - alpha/A;

%----------------------
%   Band-pass Filter 1
%----------------------
% Constant skirt gain, peak gain = Q
elseif strcmp(type,'bp1')
    b0 =   sin(w0)/2;
    b1 =   0;
    b2 =  -sin(w0)/2;
    a0 =   1 + alpha;
    a1 =  -2*cos(w0);
    a2 =   1 - alpha;

%----------------------
%   Band-pass Filter 2
%----------------------
% Constant 0 dB peak gain
elseif strcmp(type,'bp2')
    b0 =   alpha;
    b1 =   0;
    b2 =  -alpha;
    a0 =   1 + alpha;
    a1 =  -2*cos(w0);
    a2 =   1 - alpha;

%----------------------
%    Notch Filter
%----------------------
elseif strcmp(type,'nch')
    b0 =   1;
    b1 =  -2*cos(w0);
    b2 =   1;
    a0 =   1 + alpha;
    a1 =  -2*cos(w0);
    a2 =   1 - alpha;        

%----------------------
%    All-Pass Filter
%----------------------
elseif strcmp(type,'apf')
    b0 =   1 - alpha;
    b1 =  -2*cos(w0);
    b2 =   1 + alpha;
    a0 =   1 + alpha;
    a1 =  -2*cos(w0);
    a2 =   1 - alpha;

%----------------------
%    Low-Shelf Filter
%----------------------
elseif strcmp(type,'lsf')
    b0 = A*((A+1) - (A-1)*cos(w0) + 2*sqrt(A)*alpha);
    b1 = 2*A*((A-1) - (A+1)*cos(w0));
    b2 = A*((A+1) - (A-1)*cos(w0) - 2*sqrt(A)*alpha);
    a0 = (A+1) + (A-1)*cos(w0) + 2*sqrt(A)*alpha;
    a1 = -2*((A-1) + (A+1)*cos(w0));
    a2 = (A+1) + (A-1)*cos(w0) - 2*sqrt(A)*alpha;

%----------------------
%    High-Shelf Filter
%----------------------
elseif strcmp(type,'hsf')
    b0 = A*( (A+1) + (A-1)*cos(w0) + 2*sqrt(A)*alpha);
    b1 = -2*A*((A-1) + (A+1)*cos(w0));
    b2 = A*((A+1) + (A-1)*cos(w0) - 2*sqrt(A)*alpha);
    a0 = (A+1) - (A-1)*cos(w0) + 2*sqrt(A)*alpha;
    a1 = 2*((A-1) - (A+1)*cos(w0));
    a2 = (A+1) - (A-1)*cos(w0) - 2*sqrt(A)*alpha;

% Otherwise, no filter
else 
    b0 = 1; a0 = 1;
    b1 = 0; b2 = 0; a1 = 0; a2 = 0;
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Topology - Direct Form I, II, Transposed II
if (form == 1) % Direct Form I
    x2 = 0;    % Initial conditions 
    x1 = 0;
    y2 = 0;
    y1 = 0;
    for n = 1:N
        out(n,1) = (b0/a0)*in(n,1) + (b1/a0)*x1 + (b2/a0)*x2 ...
            + (-a1/a0)*y1 + (-a2/a0)*y2;
        x2 = x1;
        x1 = in(n,1);
        y2 = y1;
        y1 = out(n,1);
    end

elseif (form == 2) % Direct Form II
   w1 = 0;     % w1 & w2 are delayed versions of 'w'
   w2 = 0;
   for n = 1:N
       w = in(n,1) + (-a1/a0)*w1 + (-a2/a0)*w2;  
       out(n,1) = (b0/a0)*w + (b1/a0)*w1 + (b2/a0)*w2;
       w2 = w1;
       w1 = w;
   end

elseif (form == 3) % Transposed Direct Form II
   d1 = 0;    % d1 & d2 are outputs of the delay blocks
   d2 = 0;
   for n = 1:N
       out(n,1) = (b0/a0)*in(n,1) + d1;
       d1 = (b1/a0)*in(n,1) + (-a1/a0)*out(n,1) + d2;
       d2 = (b2/a0)*in(n,1) + (-a2/a0)*out(n,1); 
   end
   
else % No filtering  
   
    out = in;
    
end

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

