
threshold = 10; 

gold_vec_test_bpm = 60./gold_vec_test; 

err = gold_vec_test_bpm - transpose(testPredictions_scaled_rr_bpm); 
X = 1:1:length(err); 

[acc] = accuracy(transpose(testPredictions_scaled_rr_bpm), gold_vec_test_bpm, threshold)

figure(1)
scatter(X,err)
hold on 
yline(threshold)
hold on 
yline(-1*threshold)
% 
differences = testPredictions_scaled_rr_bpm-transpose(60./gold_vec_test);
scatter(bpm_test',differences, 'filled')
hold on;
plot(bpm_test',8*ones(length(bpm_test'),1), 'color', 'r')
hold on;
plot(bpm_test',-8*ones(length(bpm_test'),1), 'color', 'r')
xlabel('True Fetal BPM')
ylabel('Predicted BPM Difference')
text(145,9,'Threshold=8','Color','red')
text(145,-9,'Threshold=-8','Color','red')

