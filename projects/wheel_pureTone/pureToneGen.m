function [stim, events] = pureToneGen(stimInfo) % fs,tonePipDur,totalDur,cloudRange,nLogSteps,envDur,tonePipRate,toneLevel,FILT

% set variables
% stimInfo.fs              = 4e5;              % sample rate
% stimInfo.totalDur        = 1;                % total duration of each tone
% stimInfo.toneFreq = [4000 64000];            % pure tone freq
% stimInfo.envDur          = 0.005;            % duration of tone pip envelope
% stimInfo.toneLevel       = 70;               % levels of tone in dB

trialFreq = stimInfo.toneFreq(stimInfo.trialType);
atten = 70-stimInfo.toneLevel; % convert tone level to attenuation from 70 dB (filter is set to make sounds at 70 dB)

% make stim
stim = tone(trialFreq,3/2*pi,stimInfo.totalDur,stimInfo.fs); % make tone 
stim = envelopeKCW(stim,stimInfo.envDur*1000,stimInfo.fs); % envelope it

stim  = stim.*10^(-atten/20); % attenuate   

stim = conv(stim,stimInfo.FILT,'same');

% check stim
% spectrogram(stim(:,1), 1000, 0, 10000, stimInfo.fs,'yaxis');
stim = stim' / 10;

% make the events
pulseLength = .005 * stimInfo.fs;
% pad to add ending event
stim = [stim zeros(1,pulseLength-1)];
events = zeros(1,length(stim));
events(1:pulseLength) = .5;
events(length(stim)-pulseLength+1:length(stim)) = .5;

%spectrogram(stim,512,128,linspace(1,50e3,100),stimInfo.fs,'yaxis')

%% save stim
% chunk_size = []; nbits = 16;
% fn = [filename '.wav'];
% stim = (stim/10);
% wavwrite_append(stim, fn, chunk_size, fs, nbits)
% save([filename '_stimInfo.mat'],'stimInfo')

function x=tone(f,ph,dur,sf)
% x=tone(f,ph,dur,sf); returns a sine tone of freq f Hz, phase ph rad, duration dur sec at sample rate sf Hz

npts=dur*sf;
inc=2*pi*f/sf;
x=(0:npts-1)*inc+ph;
x=cos(x);

function output_signal = envelopeKCW(signal,rampDur,fs)
% This function tries to remove the transients in the signal by enveloping the first and last period. Ramp duration is defined by rampDur in **ms** envelope(signal,rampDuration,samplerate)

samples=round((rampDur/1000)*fs);
x = -pi:pi/samples:0;
y = 0:pi/samples:pi;
output_signal = signal;

% prepare the envelope functions
envelope_function(1:samples) = cos(x(1:samples))/2+0.5;

% fade in
for i = 1 : samples
    output_signal(i) = signal(i) * envelope_function(i);
end

% fade out
for i = 0 : (samples-1)
    current_position = length(signal) - i;
    output_signal(current_position) = signal(current_position) * envelope_function(i+1);
end
