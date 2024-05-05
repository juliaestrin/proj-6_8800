load("feature_vec_test.mat");
load("feature_vec_train.mat");

load("gold_vec_test.mat");
load("gold_vec_train.mat");

%%
feature_vec_train = feature_vec_train';
%%
bpm_train = 60./gold_vec_train;
bpm_test = 60./gold_vec_test;

[bpm_train_z, mu_train, sigma_train] = zscore(bpm_train);
[bpm_test_z, mu_test, sigma_test] = zscore(bpm_test);


[rr_train_z, mu_rr_train, sigma_rr_train] = zscore(gold_vec_train);
[rr_test_z, mu_rr_test, sigma_rr_test] = zscore(gold_vec_test);

% 
%% TRAIN ON RR INTERVAL
trainPredictions_rr = trainedModel_zscore_RR_optimized.predictFcn(feature_vec_train);
trainPredictions_scaled_rr = (trainPredictions_rr*sigma_rr_train) + mu_rr_train;
trainPredictions_scaled_rr_bpm = 60./trainPredictions_scaled_rr;
trainRMSE_rr = rmse(trainPredictions_scaled_rr, gold_vec_train');
trainRMSE_rr_bpm = rmse(trainPredictions_scaled_rr_bpm, bpm_train');
figure;
plot(bpm_train',trainPredictions_scaled_rr_bpm,".")
hold on
plot(bpm_train',bpm_train')
hold off
xlabel("True fetal BPM")
ylabel("Predicted fetal BPM")
title("Training Data results")
%%
testPredictions_rr = trainedModel_zscore_RR_optimized.predictFcn(feature_vec_test);
testPredictions_scaled_rr = (testPredictions_rr*sigma_rr_test) + mu_rr_test;
testPredictions_scaled_rr_bpm = 60./testPredictions_scaled_rr;
testRMSE_rr_bpm = rmse(testPredictions_scaled_rr_bpm, bpm_test');
testRMSE_rr = rmse(testPredictions_scaled_rr, gold_vec_test');

%% TRAIN ON BPM
trainPredictions = trainedModel_zscore_bpm.predictFcn(feature_vec_train);
trainPredictions_scaled = (trainPredictions*sigma_train) + mu_train;
trainRMSE = rmse(trainPredictions_scaled, bpm_train');
figure;
plot(bpm_train',trainPredictions_scaled,".")
hold on
plot(bpm_train',bpm_train')
hold off
xlabel("True fetal BPM")
ylabel("Predicted fetal BPM")
title("Training Data results")

testPredictions = trainedModel_zscore_bpm.predictFcn(feature_vec_test);
testPredictions_scaled = (testPredictions*sigma_test) + mu_test;
testRMSE = rmse(testPredictions_scaled, bpm_test');

figure;
plot(bpm_test',testPredictions_scaled,".")
hold on
plot(bpm_test',bpm_test')
hold off
xlabel("True fetal BPM")
ylabel("Predicted fetal BPM")
title("Test Data results")

%%

% Mdl = fitrnet(feature_vec_train,bpm_train,"Standardize",true, ...
%     "LayerSizes",[30 30 10 1]);
% 
% testMSE = loss(Mdl,feature_vec_test,bpm_test);
% %
% testPredictions = predict(Mdl,feature_vec_test);
% figure;
% plot(bpm_test,testPredictions,".")
% hold on
% plot(bpm_test,bpm_test)
% hold off
% xlabel("True fetal BPM")
% ylabel("Predicted fetal BPM")
% 
% yFit = resubPredict(Mdl);
% figure;
% plot(bpm_train,yFit,".")
% hold on
% plot(bpm_train,bpm_train)
% hold off
% xlabel("True fetal BPM")
% ylabel("Predicted fetal BPM")
% %
