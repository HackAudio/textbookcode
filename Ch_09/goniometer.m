% GONIOMETER
%
% This function analyzes a stereo audio signal and
% creates a goniometer plot. This visualization indicates
% the stereo width of a signal. 
%
% Values along the vertical axis represent parts of 
% the signal in the middle (or center) of the 
% stereo field. This occurs when the left and right 
% channels are identical. Conversely, values along 
% the horizontal axis represent parts of the signal 
% when the left and right channels have opposite polarities. 
%
% Values at an angle of 45 degrees represent when 
% there is a signal panned to the right channel and 
% the left channel has zero amplitude. Similarly, values 
% at an angle of 135 degrees represent when there is 
% a signal panned to the left channel and the right 
% channel has zero amplitude.
%
% See also GONIOMETEREXAMPLE
function goniometer(in)
N = length(in);
x = zeros(N,1);
y = zeros(N,1);

for n = 1:N
    L = in(n,1);
    R = in(n,2);
    
    radius = sqrt(L^2 + R^2);
    angle = atan2(L,R);
    angle = angle + (pi/4); % Rotate by convention
    
    x(n,1) = radius * cos(angle);
    y(n,1) = radius * sin(angle);

end

line([-1 1] ,[-1 1],'Color',[0.75 0.75 0.75]);
line([-1 1] ,[1 -1],'Color',[0.75 0.75 0.75]);
line([0 0] ,[-1 0.95],'Color',[0.75 0.75 0.75]);
line([-0.95 1] ,[0 0],'Color',[0.75 0.75 0.75]);
hold on;
% Circle
th = 0:pi/50:2*pi;
xunit = cos(th);
yunit = sin(th);
plot(xunit, yunit,'Color',[0.75 0.75 0.75]);
% Left
xL = -0.75;
yL = 0.8;
txtL = 'L';
text(xL,yL,txtL,'Color',[0.75 0.75 0.75]);

%Right
xR = 0.73;
yR = 0.8;
txtR = 'R';
text(xR,yR,txtR,'Color',[0.75 0.75 0.75]);

%Mid
xM = -0.018;
yM = 0.96;
txtM = 'M';
text(xM,yM,txtM,'Color',[0.75 0.75 0.75]);

%Side
xS = -0.98;
yS = 0;
txtS = 'S';
text(xS,yS,txtS,'Color',[0.75 0.75 0.75]);

% Plot Data
plot(x,y,'.b'); axis([-1 1 -1 1]);
hold off;

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
