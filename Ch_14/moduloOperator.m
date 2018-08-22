% MODULOOPERATOR
% This script demonstrates the result of the modulo
% operator - mod(a,m);
%
% See also MOD

clear;clc;
m = 4;
for a = 1:15
    
   disp(['When "a" is : ', num2str(a)]); 
   disp(['mod(a,4) is : ', num2str(mod(a,m))]); disp(' ');
   
end