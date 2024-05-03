
N = 74;
N_train = floor(N*0.8); 
fs = 1000; 

feature_vec_train = [];
feature_vec_test = [];

%% Create feature vector for training 
j = 1; 

for k = 1:N_train
    c1 = r01_train_ICA.(strcat('c1_',num2str(k))); 
    c2 = r01_train_ICA.(strcat('c2_',num2str(k)));

    [num_peaks_c1, avg_spacing_c1, avg_peak_mag_c1] = featPeak(c1,fs);
    [num_peaks_c2, avg_spacing_c2, avg_peak_mag_c2] = featPeak(c2,fs);

    if num_peaks_c1 >= num_peaks_c2
        feature_vec_train(:,j) = [num_peaks_c2; num_peaks_c1; avg_spacing_c2; avg_spacing_c1;avg_peak_mag_c2;avg_peak_mag_c1]; 
    else 
        feature_vec_train(:,j) = [num_peaks_c1; num_peaks_c2; avg_spacing_c1; avg_spacing_c2;avg_peak_mag_c1;avg_peak_mag_c2]; 
    end 
    j = j + 1; 
end 

for k = 1:N_train
    c1 = r04_train_ICA.(strcat('c1_',num2str(k))); 
    c2 = r04_train_ICA.(strcat('c2_',num2str(k)));

    [num_peaks_c1, avg_spacing_c1, avg_peak_mag_c1] = featPeak(c1,fs);
    [num_peaks_c2, avg_spacing_c2, avg_peak_mag_c2] = featPeak(c2,fs);

    if num_peaks_c1 >= num_peaks_c2
        feature_vec_train(:,j) = [num_peaks_c2; num_peaks_c1; avg_spacing_c2; avg_spacing_c1;avg_peak_mag_c2;avg_peak_mag_c1]; 
    else 
        feature_vec_train(:,j) = [num_peaks_c1; num_peaks_c2; avg_spacing_c1; avg_spacing_c2;avg_peak_mag_c1;avg_peak_mag_c2]; 
    end 
    j = j + 1; 
end 

for k = 1:N_train
    c1 = r07_train_ICA.(strcat('c1_',num2str(k))); 
    c2 = r07_train_ICA.(strcat('c2_',num2str(k)));

    [num_peaks_c1, avg_spacing_c1, avg_peak_mag_c1] = featPeak(c1,fs);
    [num_peaks_c2, avg_spacing_c2, avg_peak_mag_c2] = featPeak(c2,fs);

    if num_peaks_c1 >= num_peaks_c2
        feature_vec_train(:,j) = [num_peaks_c2; num_peaks_c1; avg_spacing_c2; avg_spacing_c1;avg_peak_mag_c2;avg_peak_mag_c1]; 
    else 
        feature_vec_train(:,j) = [num_peaks_c1; num_peaks_c2; avg_spacing_c1; avg_spacing_c2;avg_peak_mag_c1;avg_peak_mag_c2]; 
    end 
    j = j + 1; 
end 

for k = 1:N_train
    c1 = r08_train_ICA.(strcat('c1_',num2str(k))); 
    c2 = r08_train_ICA.(strcat('c2_',num2str(k)));

    [num_peaks_c1, avg_spacing_c1, avg_peak_mag_c1] = featPeak(c1,fs);
    [num_peaks_c2, avg_spacing_c2, avg_peak_mag_c2] = featPeak(c2,fs);

    if num_peaks_c1 >= num_peaks_c2
        feature_vec_train(:,j) = [num_peaks_c2; num_peaks_c1; avg_spacing_c2; avg_spacing_c1;avg_peak_mag_c2;avg_peak_mag_c1]; 
    else 
        feature_vec_train(:,j) = [num_peaks_c1; num_peaks_c2; avg_spacing_c1; avg_spacing_c2;avg_peak_mag_c1;avg_peak_mag_c2]; 
    end 
    j = j + 1; 
end 

for k = 1:N_train
    c1 = r10_train_ICA.(strcat('c1_',num2str(k))); 
    c2 = r10_train_ICA.(strcat('c2_',num2str(k)));

    [num_peaks_c1, avg_spacing_c1, avg_peak_mag_c1] = featPeak(c1,fs);
    [num_peaks_c2, avg_spacing_c2, avg_peak_mag_c2] = featPeak(c2,fs);

    if num_peaks_c1 >= num_peaks_c2
        feature_vec_train(:,j) = [num_peaks_c2; num_peaks_c1; avg_spacing_c2; avg_spacing_c1;avg_peak_mag_c2;avg_peak_mag_c1]; 
    else 
        feature_vec_train(:,j) = [num_peaks_c1; num_peaks_c2; avg_spacing_c1; avg_spacing_c2;avg_peak_mag_c1;avg_peak_mag_c2]; 
    end 
    j = j + 1; 
end 

%% Create feature vector for testing 
j = 1; 

for k = N_train+1:N
    c1 = r01_test_ICA.(strcat('c1_',num2str(k))); 
    c2 = r01_test_ICA.(strcat('c2_',num2str(k)));

    [num_peaks_c1, avg_spacing_c1, avg_peak_mag_c1] = featPeak(c1,fs);
    [num_peaks_c2, avg_spacing_c2, avg_peak_mag_c2] = featPeak(c2,fs);

    if num_peaks_c1 >= num_peaks_c2
        feature_vec_test(:,j) = [num_peaks_c2; num_peaks_c1; avg_spacing_c2; avg_spacing_c1;avg_peak_mag_c2;avg_peak_mag_c1]; 
    else 
        feature_vec_test(:,j) = [num_peaks_c1; num_peaks_c2; avg_spacing_c1; avg_spacing_c2;avg_peak_mag_c1;avg_peak_mag_c2]; 
    end 
    j = j + 1; 
end 

for k = N_train+1:N
    c1 = r04_test_ICA.(strcat('c1_',num2str(k))); 
    c2 = r04_test_ICA.(strcat('c2_',num2str(k)));

    [num_peaks_c1, avg_spacing_c1, avg_peak_mag_c1] = featPeak(c1,fs);
    [num_peaks_c2, avg_spacing_c2, avg_peak_mag_c2] = featPeak(c2,fs);

    if num_peaks_c1 >= num_peaks_c2
        feature_vec_test(:,j) = [num_peaks_c2; num_peaks_c1; avg_spacing_c2; avg_spacing_c1;avg_peak_mag_c2;avg_peak_mag_c1]; 
    else 
        feature_vec_test(:,j) = [num_peaks_c1; num_peaks_c2; avg_spacing_c1; avg_spacing_c2;avg_peak_mag_c1;avg_peak_mag_c2]; 
    end 
    j = j + 1; 
end 

for k = N_train+1:N
    c1 = r07_test_ICA.(strcat('c1_',num2str(k))); 
    c2 = r07_test_ICA.(strcat('c2_',num2str(k)));

    [num_peaks_c1, avg_spacing_c1, avg_peak_mag_c1] = featPeak(c1,fs);
    [num_peaks_c2, avg_spacing_c2, avg_peak_mag_c2] = featPeak(c2,fs);

    if num_peaks_c1 >= num_peaks_c2
        feature_vec_test(:,j) = [num_peaks_c2; num_peaks_c1; avg_spacing_c2; avg_spacing_c1;avg_peak_mag_c2;avg_peak_mag_c1]; 
    else 
        feature_vec_test(:,j) = [num_peaks_c1; num_peaks_c2; avg_spacing_c1; avg_spacing_c2;avg_peak_mag_c1;avg_peak_mag_c2]; 
    end 
    j = j + 1; 
end 

for k = N_train+1:N
    c1 = r08_test_ICA.(strcat('c1_',num2str(k))); 
    c2 = r08_test_ICA.(strcat('c2_',num2str(k)));

    [num_peaks_c1, avg_spacing_c1, avg_peak_mag_c1] = featPeak(c1,fs);
    [num_peaks_c2, avg_spacing_c2, avg_peak_mag_c2] = featPeak(c2,fs);

    if num_peaks_c1 >= num_peaks_c2
        feature_vec_test(:,j) = [num_peaks_c2; num_peaks_c1; avg_spacing_c2; avg_spacing_c1;avg_peak_mag_c2;avg_peak_mag_c1]; 
    else 
        feature_vec_test(:,j) = [num_peaks_c1; num_peaks_c2; avg_spacing_c1; avg_spacing_c2;avg_peak_mag_c1;avg_peak_mag_c2]; 
    end 
    j = j + 1; 
end 

for k = N_train+1:N
    c1 = r10_test_ICA.(strcat('c1_',num2str(k))); 
    c2 = r10_test_ICA.(strcat('c2_',num2str(k)));

    [num_peaks_c1, avg_spacing_c1, avg_peak_mag_c1] = featPeak(c1,fs);
    [num_peaks_c2, avg_spacing_c2, avg_peak_mag_c2] = featPeak(c2,fs);

    if num_peaks_c1 >= num_peaks_c2
        feature_vec_test(:,j) = [num_peaks_c2; num_peaks_c1; avg_spacing_c2; avg_spacing_c1;avg_peak_mag_c2;avg_peak_mag_c1]; 
    else 
        feature_vec_test(:,j) = [num_peaks_c1; num_peaks_c2; avg_spacing_c1; avg_spacing_c2;avg_peak_mag_c1;avg_peak_mag_c2]; 
    end 
    j = j + 1; 
end 

%% Save the data 

save("data_chunked\feature_vec_train","feature_vec_train"); 
save("data_chunked\feature_vec_test","feature_vec_test");

%% Create column of gold standard for training
j = 1; 
for k = 1:N_train
    gold_vec_train(j) = r01_train.(strcat('gold_',num2str(k)));
    j = j + 1; 
end 
for k = 1:N_train
    gold_vec_train(j) = r04_train.(strcat('gold_',num2str(k)));
    j = j + 1; 
end 
for k = 1:N_train
    gold_vec_train(j) = r07_train.(strcat('gold_',num2str(k)));
    j = j + 1; 
end 
for k = 1:N_train
    gold_vec_train(j) = r08_train.(strcat('gold_',num2str(k)));
    j = j + 1; 
end 
for k = 1:N_train
    gold_vec_train(j) = r10_train.(strcat('gold_',num2str(k)));
    j = j + 1; 
end 


%% Create column of gold standard for testing
j = 1; 
for k = N_train+1:N
    gold_vec_test(j) = r01_test.(strcat('gold_',num2str(k)));
    j = j + 1; 
end 
for k = N_train+1:N
    gold_vec_test(j) = r04_test.(strcat('gold_',num2str(k)));
    j = j + 1; 
end 
for k = N_train+1:N
    gold_vec_test(j) = r07_test.(strcat('gold_',num2str(k)));
    j = j + 1; 
end 
for k = N_train+1:N
    gold_vec_test(j) = r08_test.(strcat('gold_',num2str(k)));
    j = j + 1; 
end 
for k = N_train+1:N
    gold_vec_test(j) = r10_test.(strcat('gold_',num2str(k)));
    j = j + 1; 
end 

save("data_chunked\gold_vec_train","gold_vec_train"); 
save("data_chunked\gold_vec_test","gold_vec_test");