% PITCHSHIFTER
% This function implements the pitch shifter
% audio effect by using two parallel delay lines.
% The delay time for each line is modulated by
% a sawtooth LFO. The frequency of the LFO is
% based on the desired number of semitones for 
% the pitch shifter. Both increases and decreases
% in pitch are possible with this function. 
%
% Both LFOs repeat a cycle such that the delay
% time stays within a range of 0 ms to 50 ms.
% This way the processed signal is not significantly
% shorter or longer than the original signal. 
%
% The cycles of the two LFOS are intentionally
% offset to have an overlap. An amplitude crossfade
% is applied to the delay lines to switch between
% the two during the overlap. The crossfade reduces
% the audibility of the relatively large discontinuity
% in the delay time at the start of each LFO cycle.
%
% See also PITCHSHIFTEREXAMPLE, CROSSFADES, LFOPITCH

function [out] = pitchShifter(in,Fs,semitones)
Ts = 1/Fs;
N = length(in);      % Total number of samples
out = zeros(N,1);
lfo1 = zeros(N,1);   % For visualizing the LFOs
lfo2 = zeros(N,1);

maxDelay = Fs * .05;  % Maximum Delay is 50 ms
buffer1 = zeros(maxDelay+1,1);   
buffer2 = zeros(maxDelay+1,1);    % Initialize Delay Buffers

tr = 2^(semitones/12);     % Convert Semitones 
dRate = 1 - tr;            % Delay Rate of Change

tau = (maxDelay/abs(dRate))*Ts;  % Period of Sawtooth LFO
freq = 1/tau;                    % Frequency of LFO

fade = round((tau*Fs)/8);  % Fade length is 1/8th of a cycle
Hz = (freq/2)*(8/7);       % Frequency of crossfade due to overlap
[g1,g2] = crossfades(Fs,N,Hz,fade); % Crossfade Gains

if dRate > 0   % Pitch Decrease
     % Initialize delay so LFO cycles line up with crossfade
    d1 = dRate * fade;  
    d2 = maxDelay; 
    d1Temp = d1;  % These variables are used to control 
    d2Temp = d2;  % the length of each cycle of the LFO
                  % for the proper amount of overlap
                  
else           % Pitch Increase
    % Initialize delay so LFO cycles line up with crossfade
    d1 = maxDelay - maxDelay/8;   
    d2 = 0;
    d1Temp = d1;
    d2Temp = d2;
end

% Loop to Process Input Signal
for n = 1:N
    % Parallel delay processing of the input signal
    [out1,buffer1] = fractionalDelay(in(n,1),buffer1,d1);
    [out2,buffer2] = fractionalDelay(in(n,1),buffer2,d2);
    
    % Use crossfade gains to combine the output of each delay
    out(n,1) = g1(n,1)*out1 + g2(n,1)*out2;
    
    lfo1(n,1) = d1;   % Save the current delay time 
    lfo2(n,1) = d2;   % for plotting
    
    % The following conditions are set up to control the 
    % overlap of the sawtooth LFOs
    if dRate < 0 % Slope of LFO is negative (Pitch up)
        d1 = d1 + dRate;
        d1Temp = d1Temp + dRate;
        if d1 < 0 
            d1 = 0; % Portion of LFO where delay time = 0
        end
        if d1Temp < -maxDelay * (6/8) % Start next cycle
            d1 = maxDelay;
            d1Temp = maxDelay;
        end
            
        d2 = d2 + dRate;   
        d2Temp = d2Temp + dRate;
        if d2 < 0 
            d2 = 0; % Portion of LFO where delay time = 0
        end
        if d2Temp < -maxDelay * (6/8) % Start new cycle
            d2 = maxDelay;
            d2Temp = maxDelay;
        end
        
    else  % Slope of LFO is positive (Pitch Down)
       
        d1Temp = d1Temp + dRate;
        if d1Temp > maxDelay % Start next cycle
            d1 = 0;
            d1Temp = -maxDelay * (6/8);
        elseif d1Temp < 0
            d1 = 0;      % Portion where delay time = 0
        else
            d1 = d1 + dRate;
        end
            
        
        d2Temp = d2Temp + dRate;
        if d2Temp > maxDelay 
            d2 = 0;
            d2Temp = -maxDelay * (6/8);
        elseif d2Temp < 0
            d2 = 0;
        else
            d2 = d2 + dRate;
        end
        
    end
end


% Uncomment for plotting
% t = [0:N-1]*Ts;
% subplot(4,1,1);  % Waveform
% plot(t,lfo1,t,lfo2);
% axis([0 t(end) -100 maxDelay]); ylabel('Delay');
% 
% subplot(4,1,2);
% plot(t,g1,t,g2); % Cross-fade gains
% axis([0 t(end) -0.1 1.1]);ylabel('Amplitude');
% 
% 
% nfft = 2048; % length of each time frame
% window = hann(nfft); % calculated windowing function
% overlap = 128; % Number of samples for frame overlap
% [y,f,tS,p] = spectrogram(out,window,overlap,nfft,Fs);
% 
% 
% subplot(4,1,3:4); % Lower Subplot Spectrogram 
% surf(tS,f,10*log10(p),'EdgeColor','none');
% axis xy; axis tight; view(0,90);
% xlabel('Time (sec.)');ylabel('Frequency (Hz)');



