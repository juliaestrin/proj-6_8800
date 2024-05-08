load("feature_vec_test_NonICA_4s.mat");
load("feature_vec_train_NonICA_4s.mat");

load("gold_vec_test_4s.mat");
load("gold_vec_train_4s.mat");

gold_vec_test_4s = 60./gold_vec_test_4s;
gold_vec_train_4s = 60./gold_vec_train_4s;

testPredictions = trainedModel.predictFcn(feature_vec_test_NonICA_4s);
RMSE = rmse(testPredictions', gold_vec_test_4s);

acc = accuracy(gold_vec_test_4s', testPredictions, 4);

%%
figure(1)
clf
differences = testPredictions-gold_vec_test_4s';
scatter(gold_vec_test_4s',differences, 'filled')
hold on;
plot(gold_vec_test_4s',8*ones(length(gold_vec_test_4s'),1), 'color', 'r')
hold on;
plot(gold_vec_test_4s',-8*ones(length(gold_vec_test_4s'),1), 'color', 'r')
xlabel('True Fetal BPM')
ylabel('Predicted BPM Difference')
text(145,9,'Threshold=8','Color','red')
text(145,-9,'Threshold=-8','Color','red')

%%
figure(2)
clf
scatter(gold_vec_test_4s, testPredictions', 'filled')
hold on
x = 100:160;
plot(x,x)
grid on
xlabel('True Response')
ylabel('Predicted Response')
title('Predictions, Test Data')

