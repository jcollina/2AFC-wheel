% filter
params.filtdir = 'D:\GitHub\filters';
if ~exist(params.filtdir,'dir')
    error('Filter directory not found, pull from GitHub.');
end
load([params.filtdir filesep params.filtFile]);

% stimulus info stuff
% stimInfo.stimFunction    = 'pureToneGen';       % stimulus function
stimInfo.filt            = FILT;
stimInfo.totalDur        = 1;                % total duration of each tone cloud
stimInfo.toneFreq = 4000 * 2.^ linspace(0,3.5,8);

% ** stimInfo.lowFreqPC will change across tests **

stimInfo.lowFreqPC = 0.5; % fraction of "training" trials from the low frequency range
stimInfo.testingPC = 0.3; % fraction of trials between training ranges

stimInfo.trialPC = 100 * [(1-stimInfo.testingPC) * stimInfo.lowFreqPC ...
    repmat(((stimInfo.testingPC)) / (length(stimInfo.toneFreq)-2),1,(length(stimInfo.toneFreq)-2)) ...
    (1-stimInfo.testingPC) * (1 - stimInfo.lowFreqPC)]; % per cent presentation of each trial type (should add to 100%)

stimInfo.timeouts = [1 0 0 0 0 0 0 1]; % which trials will have timeouts
stimInfo.rewardContingency = [1 0 0 0 0 0 0 2]; % which side will be rewarded for each rate
stimInfo.envDur          = 0.005;
stimInfo.toneLevel       = 66;                  % levels of tones in dB
stimInfo.fs              = 192e3;
stimInfo.respDuration    = .5;

% task specific stuff
params.stimFunc = 'pureToneGen(stimInfo);';
params.taskType = 'PT_initial_psychometric';

% booth specific parameters
params.boothID = 'booth1';
params.com = 'COM4';
params.device = 'Lynx E44';
params.channel = [1 2];
params.filtFile = 'booth1-170727-wdsfilter-192kHz';
params.ampF = 10/11;

% task parameters
params.fs                 = stimInfo.fs;
params.filt               = stimInfo.filt;
params.trialTypeRatios    = stimInfo.trialPC; 
params.rewardContingency  = stimInfo.rewardContingency;
params.timeOutContingency = stimInfo.timeouts;
params.respDuration       = stimInfo.respDuration;
params.timeoutDuration    = 5000;
params.holdDuration       = 1.5;
params.rewardDuration     = 64;
params.rotaryDebounce     = 10;

