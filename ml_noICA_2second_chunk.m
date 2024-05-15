load("feature_vec_test_NonICA_2s.mat");
load("feature_vec_train_NonICA_2s.mat");

load("gold_vec_test_2s.mat");
load("gold_vec_train_NonICA_2s.mat");
gold_vec_test_NonICA_2s = gold_vec_test_NonICA__2s
%%
%%
bpm_train = 60./gold_vec_train_NonICA_2s;
bpm_test = 60./gold_vec_test_NonICA_2s;

[bpm_train_z, mu_train, sigma_train] = zscore(bpm_train);
[bpm_test_z, mu_test, sigma_test] = zscore(bpm_test);


[rr_train_z, mu_rr_train, sigma_rr_train] = zscore(gold_vec_train_NonICA_2s);
[rr_test_z, mu_rr_test, sigma_rr_test] = zscore(gold_vec_test_NonICA_2s);

% 
%% TRAIN ON RR INTERVAL
trainPredictions_rr = trainedModel_2_second.predictFcn(feature_vec_train_NonICA_2s);
trainPredictions_scaled_rr = (trainPredictions_rr*sigma_rr_train) + mu_rr_train;
trainPredictions_scaled_rr_bpm = 60./trainPredictions_scaled_rr;
trainRMSE_rr = rmse(trainPredictions_scaled_rr, gold_vec_train_NonICA_2s');
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
testPredictions_rr = trainedModel_2_second.predictFcn(feature_vec_test_NonICA_2s);
testPredictions_scaled_rr = (testPredictions_rr*sigma_rr_train) + mu_rr_train;
testPredictions_scaled_rr_bpm = 60./testPredictions_scaled_rr;
testRMSE_rr_bpm = rmse(testPredictions_scaled_rr_bpm, bpm_test');
testRMSE_rr = rmse(testPredictions_scaled_rr, gold_vec_test_NonICA__2s');
figure;
plot(bpm_test',testPredictions_scaled_rr_bpm,".")
hold on
plot(bpm_test',bpm_test')
hold off
xlabel("True fetal BPM")
ylabel("Predicted fetal BPM")
title("Test Data results")

%%


figure(1)
clf
differences = testPredictions_scaled_rr_bpm-bpm_test';
scatter(bpm_test',differences, 'filled')
hold on;
plot(bpm_test',8*ones(length(bpm_test'),1), 'color', 'r')
hold on;
plot(bpm_test',5*ones(length(bpm_test'),1), 'color', 'r', 'linestyle', ':')
hold on;
plot(bpm_test',-8*ones(length(bpm_test'),1), 'color', 'r')
hold on;
plot(bpm_test',-5*ones(length(bpm_test'),1), 'color', 'r', 'linestyle', ':')
xlabel('True Fetal BPM')
ylabel('Predicted BPM Difference')
text(145,9,'Threshold=8','Color','red')
text(145,-9,'Threshold=-5','Color','red')
text(145,6,'Threshold=8','Color','red')
text(145,-6,'Threshold=-5','Color','red')
title("Modified Bland-Altman Plot")
%%
true = bpm_test'
threshold=8
predicted = testPredictions_scaled_rr_bpm
N = length(true);

hits = zeros(N,1);

for i = 1:length(true)
    true_i = true(i);
    predicted_i = predicted(i);
    if (true_i == predicted_i) || ((true_i - threshold <= predicted_i) && (predicted_i <= (true_i + threshold)))
         hits(i) = 1;
    end
end

summed = sum(hits);
acc = summed/N;
%%
save("trainedModel_zscore_RR_boosted_optimized","trainedModel_zscore_RR_boosted_optimized");