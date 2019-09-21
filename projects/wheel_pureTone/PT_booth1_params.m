% filter
params.filtdir = 'D:\GitHub\filters';
if ~exist(params.filtdir,'dir')
    error('Filter directory not found, pull from GitHub.');
end
load([params.filtdir filesep params.filtFile]);


% stimulus info stuff
%stimInfo.stimFunction    = 'pureToneGen';       % stimulus function
stimInfo.filt            = FILT;
stimInfo.totalDur        = 1;                   % total duration of each tone cloud
stimInfo.toneFreq        = 4000 * 2.^ [0 3.5];
stimInfo.trialPC         = [50,50];             % per cent presentation of each trial type (should add to 100%)
stimInfo.timeouts        = [1,1];               % which trials will have timeouts
stimInfo.rewardContingency = [1,2];             % which side will be rewarded for each rate
stimInfo.envDur          = 0.005;
stimInfo.toneLevel       = 66;                  % levels of tones in dB
stimInfo.fs              = 192e3;
stimInfo.respDuration = .5;

% task specific stuff
params.stimFunc = 'pureToneGen(stimInfo);';
params.taskType = 'PTtrain';

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

