% task
params.taskType = 'wheelHab';

% booth parameters
params.boothID = 'booth5';
params.com = 'COM3';
params.rewardDuration = 30;
params.rotaryDebounce = 5;
params.device = '2- Lynx E44';
params.channel = [1 2];
params.fs = 192e3;
params.filtFile = 'booth5-170727-wdsfilter-192kHz';
params.ampF = 10/11;

% stimulus parameters
params.filtdir = 'D:\GitHub\filters';
if ~exist(params.filtdir,'dir')
    error('Filter directory not found, pull from GitHub.');
end
load([params.filtdir filesep params.filtFile]);
params.filt = FILT;

% task parameters
params.holdDuration       = 500;
params.timeoutDuration    = 5000;


