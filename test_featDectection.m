
N = 148;
fs = 1000; 

feature_vec_train = [];
feature_vec_test = [];

%% Create feature vector for training 
j = 1; 

for k = 1:N
    c1 = r01_train_ICA.(strcat('c1_',num2str(k))); 
    c2 = r01_train_ICA.(strcat('c2_',num2str(k)));

    [num_peaks_c1, avg_spacing_c1, avg_peak_mag_c1] = featPeak(c1,fs);
    [num_peaks_c2, avg_spacing_c2, avg_peak_mag_c2] = featPeak(c2,fs);
    [MagMax_c1,fundFreq_c1] = featFreq(c1,fs);
    [MagMax_c2,fundFreq_c2] = featFreq(c2,fs);
    [meanFt_c1,stdFt_c1,skewFt_c1,kurFt_c1,rmsFt_c1,medFt_c1,entFt_c1] = featStat(c1); 
    [meanFt_c2,stdFt_c2,skewFt_c2,kurFt_c2,rmsFt_c2,medFt_c2,entFt_c2] = featStat(c2); 

    if num_peaks_c1 >= num_peaks_c2
        feature_vec_train(:,j) = [num_peaks_c2; num_peaks_c1; avg_spacing_c2; avg_spacing_c1;avg_peak_mag_c2;avg_peak_mag_c1; ...
            MagMax_c2; MagMax_c1; fundFreq_c2; fundFreq_c1; ...
            meanFt_c2; meanFt_c1; stdFt_c2; stdFt_c1; skewFt_c2; skewFt_c1; kurFt_c2; kurFt_c1; ...
            rmsFt_c2; rmsFt_c1; medFt_c2; medFt_c1; entFt_c2; entFt_c1]; 
    else 
        feature_vec_train(:,j) = [num_peaks_c1; num_peaks_c2; avg_spacing_c1; avg_spacing_c2;avg_peak_mag_c1;avg_peak_mag_c2; ...
            MagMax_c1; MagMax_c2; fundFreq_c1; fundFreq_c2; ...
            meanFt_c1; meanFt_c2; stdFt_c1; stdFt_c2; skewFt_c1; skewFt_c2; kurFt_c1; kurFt_c2; ...
            rmsFt_c1; rmsFt_c2; medFt_c1; medFt_c2; entFt_c1; entFt_c2];
    end 
    j = j + 1; 
end 


%%
for k = 1:N
    c1 = r04_train_ICA.(strcat('c1_',num2str(k))); 
    c2 = r04_train_ICA.(strcat('c2_',num2str(k)));

    [num_peaks_c1, avg_spacing_c1, avg_peak_mag_c1] = featPeak(c1,fs);
    [num_peaks_c2, avg_spacing_c2, avg_peak_mag_c2] = featPeak(c2,fs);
    [MagMax_c1,fundFreq_c1] = featFreq(c1,fs);
    [MagMax_c2,fundFreq_c2] = featFreq(c2,fs);
    [meanFt_c1,stdFt_c1,skewFt_c1,kurFt_c1,rmsFt_c1,medFt_c1,entFt_c1] = featStat(c1); 
    [meanFt_c2,stdFt_c2,skewFt_c2,kurFt_c2,rmsFt_c2,medFt_c2,entFt_c2] = featStat(c2); 

    if num_peaks_c1 >= num_peaks_c2
        feature_vec_train(:,j) = [num_peaks_c2; num_peaks_c1; avg_spacing_c2; avg_spacing_c1;avg_peak_mag_c2;avg_peak_mag_c1; ...
            MagMax_c2; MagMax_c1; fundFreq_c2; fundFreq_c1; ...
            meanFt_c2; meanFt_c1; stdFt_c2; stdFt_c1; skewFt_c2; skewFt_c1; kurFt_c2; kurFt_c1; ...
            rmsFt_c2; rmsFt_c1; medFt_c2; medFt_c1; entFt_c2; entFt_c1]; 
    else 
        feature_vec_train(:,j) = [num_peaks_c1; num_peaks_c2; avg_spacing_c1; avg_spacing_c2;avg_peak_mag_c1;avg_peak_mag_c2; ...
            MagMax_c1; MagMax_c2; fundFreq_c1; fundFreq_c2; ...
            meanFt_c1; meanFt_c2; stdFt_c1; stdFt_c2; skewFt_c1; skewFt_c2; kurFt_c1; kurFt_c2; ...
            rmsFt_c1; rmsFt_c2; medFt_c1; medFt_c2; entFt_c1; entFt_c2];
    end 
    j = j + 1; 
end 

for k = 1:N
    c1 = r07_train_ICA.(strcat('c1_',num2str(k))); 
    c2 = r07_train_ICA.(strcat('c2_',num2str(k)));

    [num_peaks_c1, avg_spacing_c1, avg_peak_mag_c1] = featPeak(c1,fs);
    [num_peaks_c2, avg_spacing_c2, avg_peak_mag_c2] = featPeak(c2,fs);
    [MagMax_c1,fundFreq_c1] = featFreq(c1,fs);
    [MagMax_c2,fundFreq_c2] = featFreq(c2,fs);
    [meanFt_c1,stdFt_c1,skewFt_c1,kurFt_c1,rmsFt_c1,medFt_c1,entFt_c1] = featStat(c1); 
    [meanFt_c2,stdFt_c2,skewFt_c2,kurFt_c2,rmsFt_c2,medFt_c2,entFt_c2] = featStat(c2); 

    if num_peaks_c1 >= num_peaks_c2
        feature_vec_train(:,j) = [num_peaks_c2; num_peaks_c1; avg_spacing_c2; avg_spacing_c1;avg_peak_mag_c2;avg_peak_mag_c1; ...
            MagMax_c2; MagMax_c1; fundFreq_c2; fundFreq_c1; ...
            meanFt_c2; meanFt_c1; stdFt_c2; stdFt_c1; skewFt_c2; skewFt_c1; kurFt_c2; kurFt_c1; ...
            rmsFt_c2; rmsFt_c1; medFt_c2; medFt_c1; entFt_c2; entFt_c1]; 
    else 
        feature_vec_train(:,j) = [num_peaks_c1; num_peaks_c2; avg_spacing_c1; avg_spacing_c2;avg_peak_mag_c1;avg_peak_mag_c2; ...
            MagMax_c1; MagMax_c2; fundFreq_c1; fundFreq_c2; ...
            meanFt_c1; meanFt_c2; stdFt_c1; stdFt_c2; skewFt_c1; skewFt_c2; kurFt_c1; kurFt_c2; ...
            rmsFt_c1; rmsFt_c2; medFt_c1; medFt_c2; entFt_c1; entFt_c2];
    end 
    j = j + 1; 
end 

for k = 1:N
    c1 = r08_train_ICA.(strcat('c1_',num2str(k))); 
    c2 = r08_train_ICA.(strcat('c2_',num2str(k)));

    [num_peaks_c1, avg_spacing_c1, avg_peak_mag_c1] = featPeak(c1,fs);
    [num_peaks_c2, avg_spacing_c2, avg_peak_mag_c2] = featPeak(c2,fs);
    [MagMax_c1,fundFreq_c1] = featFreq(c1,fs);
    [MagMax_c2,fundFreq_c2] = featFreq(c2,fs);
    [meanFt_c1,stdFt_c1,skewFt_c1,kurFt_c1,rmsFt_c1,medFt_c1,entFt_c1] = featStat(c1); 
    [meanFt_c2,stdFt_c2,skewFt_c2,kurFt_c2,rmsFt_c2,medFt_c2,entFt_c2] = featStat(c2); 

    if num_peaks_c1 >= num_peaks_c2
        feature_vec_train(:,j) = [num_peaks_c2; num_peaks_c1; avg_spacing_c2; avg_spacing_c1;avg_peak_mag_c2;avg_peak_mag_c1; ...
            MagMax_c2; MagMax_c1; fundFreq_c2; fundFreq_c1; ...
            meanFt_c2; meanFt_c1; stdFt_c2; stdFt_c1; skewFt_c2; skewFt_c1; kurFt_c2; kurFt_c1; ...
            rmsFt_c2; rmsFt_c1; medFt_c2; medFt_c1; entFt_c2; entFt_c1]; 
    else 
        feature_vec_train(:,j) = [num_peaks_c1; num_peaks_c2; avg_spacing_c1; avg_spacing_c2;avg_peak_mag_c1;avg_peak_mag_c2; ...
            MagMax_c1; MagMax_c2; fundFreq_c1; fundFreq_c2; ...
            meanFt_c1; meanFt_c2; stdFt_c1; stdFt_c2; skewFt_c1; skewFt_c2; kurFt_c1; kurFt_c2; ...
            rmsFt_c1; rmsFt_c2; medFt_c1; medFt_c2; entFt_c1; entFt_c2];
    end 
    j = j + 1; 
end 


%% Create feature vector for testing 
j = 1; 

for k = 1:N
    c1 = r10_test_ICA.(strcat('c1_',num2str(k))); 
    c2 = r10_test_ICA.(strcat('c2_',num2str(k)));

     [num_peaks_c1, avg_spacing_c1, avg_peak_mag_c1] = featPeak(c1,fs);
    [num_peaks_c2, avg_spacing_c2, avg_peak_mag_c2] = featPeak(c2,fs);
    [MagMax_c1,fundFreq_c1] = featFreq(c1,fs);
    [MagMax_c2,fundFreq_c2] = featFreq(c2,fs);
    [meanFt_c1,stdFt_c1,skewFt_c1,kurFt_c1,rmsFt_c1,medFt_c1,entFt_c1] = featStat(c1); 
    [meanFt_c2,stdFt_c2,skewFt_c2,kurFt_c2,rmsFt_c2,medFt_c2,entFt_c2] = featStat(c2); 

    if num_peaks_c1 >= num_peaks_c2
        feature_vec_test(:,j) = [num_peaks_c2; num_peaks_c1; avg_spacing_c2; avg_spacing_c1;avg_peak_mag_c2;avg_peak_mag_c1; ...
            MagMax_c2; MagMax_c1; fundFreq_c2; fundFreq_c1; ...
            meanFt_c2; meanFt_c1; stdFt_c2; stdFt_c1; skewFt_c2; skewFt_c1; kurFt_c2; kurFt_c1; ...
            rmsFt_c2; rmsFt_c1; medFt_c2; medFt_c1; entFt_c2; entFt_c1]; 
    else 
        feature_vec_test(:,j) = [num_peaks_c1; num_peaks_c2; avg_spacing_c1; avg_spacing_c2;avg_peak_mag_c1;avg_peak_mag_c2; ...
            MagMax_c1; MagMax_c2; fundFreq_c1; fundFreq_c2; ...
            meanFt_c1; meanFt_c2; stdFt_c1; stdFt_c2; skewFt_c1; skewFt_c2; kurFt_c1; kurFt_c2; ...
            rmsFt_c1; rmsFt_c2; medFt_c1; medFt_c2; entFt_c1; entFt_c2];
    end 
    j = j + 1; 
end 

%% Save the data 

%% Create column of gold standard for training
j = 1; 
for k = 1:N
    gold_vec_train(j) = r01_train.(strcat('gold_',num2str(k)));
    j = j + 1; 
end 
for k = 1:N
    gold_vec_train(j) = r04_train.(strcat('gold_',num2str(k)));
    j = j + 1; 
end 
for k = 1:N
    gold_vec_train(j) = r07_train.(strcat('gold_',num2str(k)));
    j = j + 1; 
end 
for k = 1:N
    gold_vec_train(j) = r08_train.(strcat('gold_',num2str(k)));
    j = j + 1; 
end 


%% Create column of gold standard for testing
j = 1; 
for k = 1:N
    gold_vec_test(j) = r10_test.(strcat('gold_',num2str(k)));
    j = j + 1; 
end 

feature_vec_train_temp = feature_vec_train;
gold_vec_train_temp = gold_vec_train;

feature_vec_test_temp = feature_vec_test; 
gold_vec_test_temp = gold_vec_test; 

clear feature_vec_train gold_vec_train feature_vec_test gold_vec_test

[feature_vec_train,gold_vec_train] = removeNans(feature_vec_train_temp,gold_vec_train_temp); 
[feature_vec_test,gold_vec_test] = removeNans(feature_vec_test_temp,gold_vec_test_temp);

save("data_chunked\feature_vec_train","feature_vec_train"); 
save("data_chunked\feature_vec_test","feature_vec_test");
save("data_chunked\gold_vec_train","gold_vec_train"); 
save("data_chunked\gold_vec_test","gold_vec_test");