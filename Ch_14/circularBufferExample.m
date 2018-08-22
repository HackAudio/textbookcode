% CIRCULARBUFFEREXAMPLE
% This script tests a circular buffer function and 
% demonstrates how it works
%
% Execution of the script is set to "pause" during each iteration
% to allow a user to view the contents of the delay buffer
% during each step. To advance from one step to the next,
% press <ENTER>
%
% See also CIRCULARBUFFER

clear;clc;
in = [1 ; -1 ; 2 ; -2 ; 3 ; zeros(5,1)];
buffer = zeros(6,1); 

% Number of samples of delay 
delay = 4; 

N = length(in);
out = zeros(N,1);
% Series Delay
for n = 1:N

    [out(n,1),buffer] = circularBuffer(in(n,1),buffer,delay,n);
    % Display current status values
    disp(['The current sample number is: ' , ...
        num2str(n)]);
    disp(['The current buffer index is: ' , ...
        num2str(mod(n-1,6) + 1)]);
    disp(['The current delay index is: ' , ...
        num2str(mod(n-delay-1,6) + 1)]);
    disp(['The input is: ' , num2str(in(n,1))]);
    disp(['The delay buffer is: [' , num2str(buffer.') , ']']);
    disp(['The output is: ' , num2str(out(n,1))]); disp(' ');
    pause;
  
end
