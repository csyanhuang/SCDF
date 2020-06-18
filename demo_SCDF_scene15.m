%% atom selection + sample selection (upsample)
clear;
close all;
addpath('./tools')
rng(0,'v5uniform')
%%
% load data  
[featMat, labVec, nCls, confDefault] = AdaptDataScene15;    
% set parameters
nTrainPerClass = confDefault.nTrainPerClass;
nAtomPerClass = confDefault.nAtomPerClass;
nClassifier = 350;
n_iter = 30;
beta = 0.01;
T = 8;
nRound = 1;
opts.nRound = nRound;
opts.nTrainPerClass = nTrainPerClass;
opts.nAtomPerClass = nAtomPerClass;
opts.nClassifier = nClassifier;
opts.n_iter = n_iter;
opts.beta = beta;
opts.T = T;
[testac] = SCDF(featMat, labVec,opts);
avgAC = mean(testac);
fprintf('The average accuracy = %f\n',avgAC);
if ~exist('Result')
    mkdir('Result')
end
savename = ['Result\',mfilename,'T',num2str(opts.T),'nC',num2str(opts.nClassifier),'nTrain',num2str(opts.nTrainPerClass),'nAtom',num2str(opts.nAtomPerClass),'.mat'];
save(savename,'T','nTrainPerClass','nAtomPerClass','testac');