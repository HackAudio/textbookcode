function [out,buffer] = fractionalDelay(x,buffer,delay)
    intDelay = floor(delay); 
    frac = delay - intDelay;
    if intDelay == 0 
        out = (1-frac) * x + ...
            frac * buffer(1,1);
    else
        out = (1-frac) * buffer(intDelay,1) + ...
            frac * buffer(intDelay+1,1);
    end
    % Store the current output in appropriate index
    buffer = [x;buffer(1:end-1,1)];