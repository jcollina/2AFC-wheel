%% save mouse info for pure tone

%clear
stimInfo.stimFunction    = 'pureToneGen.m'; % stimulus function
stimInfo.totalDur        = 1;                % total duration of each tone cloud
stimInfo.toneFreq = 4000 * 2.^ [0 3.5];
stimInfo.trialPC = [50,50]; % per cent presentation of each trial type (should add to 100%)
stimInfo.timeouts = [1,1]; % which trials will have timeouts
stimInfo.rewardContingency = [1,2]; % which side will be rewarded for each rate
stimInfo.toneLevel       = 70;               % levels of tones in dB
stimInfo.envDur          = 0.005;

%% save mouse info for pure tone testing

%clear
stimInfo.stimFunction    = 'pureToneGen.m'; % stimulus function
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
stimInfo.toneLevel       = 70;               % levels of tones in dB
stimInfo.envDur          = 0.005;
