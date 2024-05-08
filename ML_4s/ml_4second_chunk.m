load("trainedModel_zscore_RR_boosted_optimized.mat");
load("feature_vec_test.mat");
load("feature_vec_train.mat");

load("gold_vec_test.mat");
load("gold_vec_train.mat");

%%
%%
bpm_train = 60./gold_vec_train;
bpm_test = 60./gold_vec_test;

[bpm_train_z, mu_train, sigma_train] = zscore(bpm_train);
[bpm_test_z, mu_test, sigma_test] = zscore(bpm_test);


[rr_train_z, mu_rr_train, sigma_rr_train] = zscore(gold_vec_train);
[rr_test_z, mu_rr_test, sigma_rr_test] = zscore(gold_vec_test);

% 
%% TRAIN ON RR INTERVAL
trainPredictions_rr = trainedModel_zscore_RR_boosted_optimized.predictFcn(feature_vec_train);
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
%% THE PREDICTIONS IN BPM ARE STORED IN testPredictions_scaled_rr_bpm
testPredictions_rr = trainedModel_zscore_RR_boosted_optimized.predictFcn(feature_vec_test);
testPredictions_scaled_rr = (testPredictions_rr*sigma_rr_train) + mu_rr_train;
testPredictions_scaled_rr_bpm = 60./testPredictions_scaled_rr;
testRMSE_rr_bpm = rmse(testPredictions_scaled_rr_bpm, bpm_test');
testRMSE_rr = rmse(testPredictions_scaled_rr, gold_vec_test');
figure;
plot(bpm_test',testPredictions_scaled_rr_bpm,".")
hold on
plot(bpm_test',bpm_test')
hold off
xlabel("True fetal BPM")
ylabel("Predicted fetal BPM")
title("Test Data results")


%%
save("trainedModel_zscore_RR_boosted_optimized","trainedModel_zscore_RR_boosted_optimized");