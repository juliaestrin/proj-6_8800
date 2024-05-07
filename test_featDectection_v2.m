
N = 298;
% N = N * 2; 
N_test = floor(N*0.8); 
fs = 1000; 

feature_vec_train_2s = [];
feature_vec_test_2s = [];

%% Create feature vector for training 
j = 1; 

for k = 1:N_test
    c1 = r01_train_2s_ICA.(strcat('c1_',num2str(k))); 
    c2 = r01_train_2s_ICA.(strcat('c2_',num2str(k)));

    [num_peaks_c1, avg_spacing_c1, avg_peak_mag_c1] = featPeak(c1,fs);
    [num_peaks_c2, avg_spacing_c2, avg_peak_mag_c2] = featPeak(c2,fs);
    [MagMax_c1,fundFreq_c1] = featFreq(c1,fs);
    [MagMax_c2,fundFreq_c2] = featFreq(c2,fs);
    [meanFt_c1,stdFt_c1,skewFt_c1,kurFt_c1,rmsFt_c1,medFt_c1,entFt_c1] = featStat(c1); 
    [meanFt_c2,stdFt_c2,skewFt_c2,kurFt_c2,rmsFt_c2,medFt_c2,entFt_c2] = featStat(c2); 

    if num_peaks_c1 >= num_peaks_c2
        feature_vec_train_2s(:,j) = [num_peaks_c2; num_peaks_c1; avg_spacing_c2; avg_spacing_c1;avg_peak_mag_c2;avg_peak_mag_c1; ...
            MagMax_c2; MagMax_c1; fundFreq_c2; fundFreq_c1; ...
            meanFt_c2; meanFt_c1; stdFt_c2; stdFt_c1; skewFt_c2; skewFt_c1; kurFt_c2; kurFt_c1; ...
            rmsFt_c2; rmsFt_c1; medFt_c2; medFt_c1; entFt_c2; entFt_c1]; 
    else 
        feature_vec_train_2s(:,j) = [num_peaks_c1; num_peaks_c2; avg_spacing_c1; avg_spacing_c2;avg_peak_mag_c1;avg_peak_mag_c2; ...
            MagMax_c1; MagMax_c2; fundFreq_c1; fundFreq_c2; ...
            meanFt_c1; meanFt_c2; stdFt_c1; stdFt_c2; skewFt_c1; skewFt_c2; kurFt_c1; kurFt_c2; ...
            rmsFt_c1; rmsFt_c2; medFt_c1; medFt_c2; entFt_c1; entFt_c2];
    end 
    j = j + 1; 
end 


%%
for k = 1:N_test
    c1 = r04_train_2s_ICA.(strcat('c1_',num2str(k))); 
    c2 = r04_train_2s_ICA.(strcat('c2_',num2str(k)));

    [num_peaks_c1, avg_spacing_c1, avg_peak_mag_c1] = featPeak(c1,fs);
    [num_peaks_c2, avg_spacing_c2, avg_peak_mag_c2] = featPeak(c2,fs);
    [MagMax_c1,fundFreq_c1] = featFreq(c1,fs);
    [MagMax_c2,fundFreq_c2] = featFreq(c2,fs);
    [meanFt_c1,stdFt_c1,skewFt_c1,kurFt_c1,rmsFt_c1,medFt_c1,entFt_c1] = featStat(c1); 
    [meanFt_c2,stdFt_c2,skewFt_c2,kurFt_c2,rmsFt_c2,medFt_c2,entFt_c2] = featStat(c2); 

    if num_peaks_c1 >= num_peaks_c2
        feature_vec_train_2s(:,j) = [num_peaks_c2; num_peaks_c1; avg_spacing_c2; avg_spacing_c1;avg_peak_mag_c2;avg_peak_mag_c1; ...
            MagMax_c2; MagMax_c1; fundFreq_c2; fundFreq_c1; ...
            meanFt_c2; meanFt_c1; stdFt_c2; stdFt_c1; skewFt_c2; skewFt_c1; kurFt_c2; kurFt_c1; ...
            rmsFt_c2; rmsFt_c1; medFt_c2; medFt_c1; entFt_c2; entFt_c1]; 
    else 
        feature_vec_train_2s(:,j) = [num_peaks_c1; num_peaks_c2; avg_spacing_c1; avg_spacing_c2;avg_peak_mag_c1;avg_peak_mag_c2; ...
            MagMax_c1; MagMax_c2; fundFreq_c1; fundFreq_c2; ...
            meanFt_c1; meanFt_c2; stdFt_c1; stdFt_c2; skewFt_c1; skewFt_c2; kurFt_c1; kurFt_c2; ...
            rmsFt_c1; rmsFt_c2; medFt_c1; medFt_c2; entFt_c1; entFt_c2];
    end 
    j = j + 1; 
end 

for k = 1:N_test
    c1 = r07_train_2s_ICA.(strcat('c1_',num2str(k))); 
    c2 = r07_train_2s_ICA.(strcat('c2_',num2str(k)));

    [num_peaks_c1, avg_spacing_c1, avg_peak_mag_c1] = featPeak(c1,fs);
    [num_peaks_c2, avg_spacing_c2, avg_peak_mag_c2] = featPeak(c2,fs);
    [MagMax_c1,fundFreq_c1] = featFreq(c1,fs);
    [MagMax_c2,fundFreq_c2] = featFreq(c2,fs);
    [meanFt_c1,stdFt_c1,skewFt_c1,kurFt_c1,rmsFt_c1,medFt_c1,entFt_c1] = featStat(c1); 
    [meanFt_c2,stdFt_c2,skewFt_c2,kurFt_c2,rmsFt_c2,medFt_c2,entFt_c2] = featStat(c2); 

    if num_peaks_c1 >= num_peaks_c2
        feature_vec_train_2s(:,j) = [num_peaks_c2; num_peaks_c1; avg_spacing_c2; avg_spacing_c1;avg_peak_mag_c2;avg_peak_mag_c1; ...
            MagMax_c2; MagMax_c1; fundFreq_c2; fundFreq_c1; ...
            meanFt_c2; meanFt_c1; stdFt_c2; stdFt_c1; skewFt_c2; skewFt_c1; kurFt_c2; kurFt_c1; ...
            rmsFt_c2; rmsFt_c1; medFt_c2; medFt_c1; entFt_c2; entFt_c1]; 
    else 
        feature_vec_train_2s(:,j) = [num_peaks_c1; num_peaks_c2; avg_spacing_c1; avg_spacing_c2;avg_peak_mag_c1;avg_peak_mag_c2; ...
            MagMax_c1; MagMax_c2; fundFreq_c1; fundFreq_c2; ...
            meanFt_c1; meanFt_c2; stdFt_c1; stdFt_c2; skewFt_c1; skewFt_c2; kurFt_c1; kurFt_c2; ...
            rmsFt_c1; rmsFt_c2; medFt_c1; medFt_c2; entFt_c1; entFt_c2];
    end 
    j = j + 1; 
end 

for k = 1:N_test
    c1 = r08_train_2s_ICA.(strcat('c1_',num2str(k))); 
    c2 = r08_train_2s_ICA.(strcat('c2_',num2str(k)));

    [num_peaks_c1, avg_spacing_c1, avg_peak_mag_c1] = featPeak(c1,fs);
    [num_peaks_c2, avg_spacing_c2, avg_peak_mag_c2] = featPeak(c2,fs);
    [MagMax_c1,fundFreq_c1] = featFreq(c1,fs);
    [MagMax_c2,fundFreq_c2] = featFreq(c2,fs);
    [meanFt_c1,stdFt_c1,skewFt_c1,kurFt_c1,rmsFt_c1,medFt_c1,entFt_c1] = featStat(c1); 
    [meanFt_c2,stdFt_c2,skewFt_c2,kurFt_c2,rmsFt_c2,medFt_c2,entFt_c2] = featStat(c2); 

    if num_peaks_c1 >= num_peaks_c2
        feature_vec_train_2s(:,j) = [num_peaks_c2; num_peaks_c1; avg_spacing_c2; avg_spacing_c1;avg_peak_mag_c2;avg_peak_mag_c1; ...
            MagMax_c2; MagMax_c1; fundFreq_c2; fundFreq_c1; ...
            meanFt_c2; meanFt_c1; stdFt_c2; stdFt_c1; skewFt_c2; skewFt_c1; kurFt_c2; kurFt_c1; ...
            rmsFt_c2; rmsFt_c1; medFt_c2; medFt_c1; entFt_c2; entFt_c1]; 
    else 
        feature_vec_train_2s(:,j) = [num_peaks_c1; num_peaks_c2; avg_spacing_c1; avg_spacing_c2;avg_peak_mag_c1;avg_peak_mag_c2; ...
            MagMax_c1; MagMax_c2; fundFreq_c1; fundFreq_c2; ...
            meanFt_c1; meanFt_c2; stdFt_c1; stdFt_c2; skewFt_c1; skewFt_c2; kurFt_c1; kurFt_c2; ...
            rmsFt_c1; rmsFt_c2; medFt_c1; medFt_c2; entFt_c1; entFt_c2];
    end 
    j = j + 1; 
end 

for k = 1:N_test
    c1 = r10_train_2s_ICA.(strcat('c1_',num2str(k))); 
    c2 = r04_train_2s_ICA.(strcat('c2_',num2str(k)));

    [num_peaks_c1, avg_spacing_c1, avg_peak_mag_c1] = featPeak(c1,fs);
    [num_peaks_c2, avg_spacing_c2, avg_peak_mag_c2] = featPeak(c2,fs);
    [MagMax_c1,fundFreq_c1] = featFreq(c1,fs);
    [MagMax_c2,fundFreq_c2] = featFreq(c2,fs);
    [meanFt_c1,stdFt_c1,skewFt_c1,kurFt_c1,rmsFt_c1,medFt_c1,entFt_c1] = featStat(c1); 
    [meanFt_c2,stdFt_c2,skewFt_c2,kurFt_c2,rmsFt_c2,medFt_c2,entFt_c2] = featStat(c2); 

    if num_peaks_c1 >= num_peaks_c2
        feature_vec_train_2s(:,j) = [num_peaks_c2; num_peaks_c1; avg_spacing_c2; avg_spacing_c1;avg_peak_mag_c2;avg_peak_mag_c1; ...
            MagMax_c2; MagMax_c1; fundFreq_c2; fundFreq_c1; ...
            meanFt_c2; meanFt_c1; stdFt_c2; stdFt_c1; skewFt_c2; skewFt_c1; kurFt_c2; kurFt_c1; ...
            rmsFt_c2; rmsFt_c1; medFt_c2; medFt_c1; entFt_c2; entFt_c1]; 
    else 
        feature_vec_train_2s(:,j) = [num_peaks_c1; num_peaks_c2; avg_spacing_c1; avg_spacing_c2;avg_peak_mag_c1;avg_peak_mag_c2; ...
            MagMax_c1; MagMax_c2; fundFreq_c1; fundFreq_c2; ...
            meanFt_c1; meanFt_c2; stdFt_c1; stdFt_c2; skewFt_c1; skewFt_c2; kurFt_c1; kurFt_c2; ...
            rmsFt_c1; rmsFt_c2; medFt_c1; medFt_c2; entFt_c1; entFt_c2];
    end 
    j = j + 1; 
end 
%% Create feature vector for testing 
j = 1; 

for k = N_test+1:N
    c1 = r01_test_2s_ICA.(strcat('c1_',num2str(k))); 
    c2 = r01_test_2s_ICA.(strcat('c2_',num2str(k)));

    [num_peaks_c1, avg_spacing_c1, avg_peak_mag_c1] = featPeak(c1,fs);
    [num_peaks_c2, avg_spacing_c2, avg_peak_mag_c2] = featPeak(c2,fs);
    [MagMax_c1,fundFreq_c1] = featFreq(c1,fs);
    [MagMax_c2,fundFreq_c2] = featFreq(c2,fs);
    [meanFt_c1,stdFt_c1,skewFt_c1,kurFt_c1,rmsFt_c1,medFt_c1,entFt_c1] = featStat(c1); 
    [meanFt_c2,stdFt_c2,skewFt_c2,kurFt_c2,rmsFt_c2,medFt_c2,entFt_c2] = featStat(c2); 

    if num_peaks_c1 >= num_peaks_c2
        feature_vec_test_2s(:,j) = [num_peaks_c2; num_peaks_c1; avg_spacing_c2; avg_spacing_c1;avg_peak_mag_c2;avg_peak_mag_c1; ...
            MagMax_c2; MagMax_c1; fundFreq_c2; fundFreq_c1; ...
            meanFt_c2; meanFt_c1; stdFt_c2; stdFt_c1; skewFt_c2; skewFt_c1; kurFt_c2; kurFt_c1; ...
            rmsFt_c2; rmsFt_c1; medFt_c2; medFt_c1; entFt_c2; entFt_c1]; 
    else 
        feature_vec_test_2s(:,j) = [num_peaks_c1; num_peaks_c2; avg_spacing_c1; avg_spacing_c2;avg_peak_mag_c1;avg_peak_mag_c2; ...
            MagMax_c1; MagMax_c2; fundFreq_c1; fundFreq_c2; ...
            meanFt_c1; meanFt_c2; stdFt_c1; stdFt_c2; skewFt_c1; skewFt_c2; kurFt_c1; kurFt_c2; ...
            rmsFt_c1; rmsFt_c2; medFt_c1; medFt_c2; entFt_c1; entFt_c2];
    end 
    j = j + 1; 
end 

for k = N_test+1:N
    c1 = r04_test_2s_ICA.(strcat('c1_',num2str(k))); 
    c2 = r04_test_2s_ICA.(strcat('c2_',num2str(k)));

    [num_peaks_c1, avg_spacing_c1, avg_peak_mag_c1] = featPeak(c1,fs);
    [num_peaks_c2, avg_spacing_c2, avg_peak_mag_c2] = featPeak(c2,fs);
    [MagMax_c1,fundFreq_c1] = featFreq(c1,fs);
    [MagMax_c2,fundFreq_c2] = featFreq(c2,fs);
    [meanFt_c1,stdFt_c1,skewFt_c1,kurFt_c1,rmsFt_c1,medFt_c1,entFt_c1] = featStat(c1); 
    [meanFt_c2,stdFt_c2,skewFt_c2,kurFt_c2,rmsFt_c2,medFt_c2,entFt_c2] = featStat(c2); 

    if num_peaks_c1 >= num_peaks_c2
        feature_vec_test_2s(:,j) = [num_peaks_c2; num_peaks_c1; avg_spacing_c2; avg_spacing_c1;avg_peak_mag_c2;avg_peak_mag_c1; ...
            MagMax_c2; MagMax_c1; fundFreq_c2; fundFreq_c1; ...
            meanFt_c2; meanFt_c1; stdFt_c2; stdFt_c1; skewFt_c2; skewFt_c1; kurFt_c2; kurFt_c1; ...
            rmsFt_c2; rmsFt_c1; medFt_c2; medFt_c1; entFt_c2; entFt_c1]; 
    else 
        feature_vec_test_2s(:,j) = [num_peaks_c1; num_peaks_c2; avg_spacing_c1; avg_spacing_c2;avg_peak_mag_c1;avg_peak_mag_c2; ...
            MagMax_c1; MagMax_c2; fundFreq_c1; fundFreq_c2; ...
            meanFt_c1; meanFt_c2; stdFt_c1; stdFt_c2; skewFt_c1; skewFt_c2; kurFt_c1; kurFt_c2; ...
            rmsFt_c1; rmsFt_c2; medFt_c1; medFt_c2; entFt_c1; entFt_c2];
    end 
    j = j + 1; 
end 

for k = N_test+1:N
    c1 = r07_test_2s_ICA.(strcat('c1_',num2str(k))); 
    c2 = r07_test_2s_ICA.(strcat('c2_',num2str(k)));

    [num_peaks_c1, avg_spacing_c1, avg_peak_mag_c1] = featPeak(c1,fs);
    [num_peaks_c2, avg_spacing_c2, avg_peak_mag_c2] = featPeak(c2,fs);
    [MagMax_c1,fundFreq_c1] = featFreq(c1,fs);
    [MagMax_c2,fundFreq_c2] = featFreq(c2,fs);
    [meanFt_c1,stdFt_c1,skewFt_c1,kurFt_c1,rmsFt_c1,medFt_c1,entFt_c1] = featStat(c1); 
    [meanFt_c2,stdFt_c2,skewFt_c2,kurFt_c2,rmsFt_c2,medFt_c2,entFt_c2] = featStat(c2); 

    if num_peaks_c1 >= num_peaks_c2
        feature_vec_test_2s(:,j) = [num_peaks_c2; num_peaks_c1; avg_spacing_c2; avg_spacing_c1;avg_peak_mag_c2;avg_peak_mag_c1; ...
            MagMax_c2; MagMax_c1; fundFreq_c2; fundFreq_c1; ...
            meanFt_c2; meanFt_c1; stdFt_c2; stdFt_c1; skewFt_c2; skewFt_c1; kurFt_c2; kurFt_c1; ...
            rmsFt_c2; rmsFt_c1; medFt_c2; medFt_c1; entFt_c2; entFt_c1]; 
    else 
        feature_vec_test_2s(:,j) = [num_peaks_c1; num_peaks_c2; avg_spacing_c1; avg_spacing_c2;avg_peak_mag_c1;avg_peak_mag_c2; ...
            MagMax_c1; MagMax_c2; fundFreq_c1; fundFreq_c2; ...
            meanFt_c1; meanFt_c2; stdFt_c1; stdFt_c2; skewFt_c1; skewFt_c2; kurFt_c1; kurFt_c2; ...
            rmsFt_c1; rmsFt_c2; medFt_c1; medFt_c2; entFt_c1; entFt_c2];
    end 
    j = j + 1; 
end 

for k = N_test+1:N
    c1 = r08_test_2s_ICA.(strcat('c1_',num2str(k))); 
    c2 = r08_test_2s_ICA.(strcat('c2_',num2str(k)));

    [num_peaks_c1, avg_spacing_c1, avg_peak_mag_c1] = featPeak(c1,fs);
    [num_peaks_c2, avg_spacing_c2, avg_peak_mag_c2] = featPeak(c2,fs);
    [MagMax_c1,fundFreq_c1] = featFreq(c1,fs);
    [MagMax_c2,fundFreq_c2] = featFreq(c2,fs);
    [meanFt_c1,stdFt_c1,skewFt_c1,kurFt_c1,rmsFt_c1,medFt_c1,entFt_c1] = featStat(c1); 
    [meanFt_c2,stdFt_c2,skewFt_c2,kurFt_c2,rmsFt_c2,medFt_c2,entFt_c2] = featStat(c2); 

    if num_peaks_c1 >= num_peaks_c2
        feature_vec_test_2s(:,j) = [num_peaks_c2; num_peaks_c1; avg_spacing_c2; avg_spacing_c1;avg_peak_mag_c2;avg_peak_mag_c1; ...
            MagMax_c2; MagMax_c1; fundFreq_c2; fundFreq_c1; ...
            meanFt_c2; meanFt_c1; stdFt_c2; stdFt_c1; skewFt_c2; skewFt_c1; kurFt_c2; kurFt_c1; ...
            rmsFt_c2; rmsFt_c1; medFt_c2; medFt_c1; entFt_c2; entFt_c1]; 
    else 
        feature_vec_test_2s(:,j) = [num_peaks_c1; num_peaks_c2; avg_spacing_c1; avg_spacing_c2;avg_peak_mag_c1;avg_peak_mag_c2; ...
            MagMax_c1; MagMax_c2; fundFreq_c1; fundFreq_c2; ...
            meanFt_c1; meanFt_c2; stdFt_c1; stdFt_c2; skewFt_c1; skewFt_c2; kurFt_c1; kurFt_c2; ...
            rmsFt_c1; rmsFt_c2; medFt_c1; medFt_c2; entFt_c1; entFt_c2];
    end 
    j = j + 1; 
end 

for k = N_test+1:N
    c1 = r10_test_2s_ICA.(strcat('c1_',num2str(k))); 
    c2 = r10_test_2s_ICA.(strcat('c2_',num2str(k)));

    [num_peaks_c1, avg_spacing_c1, avg_peak_mag_c1] = featPeak(c1,fs);
    [num_peaks_c2, avg_spacing_c2, avg_peak_mag_c2] = featPeak(c2,fs);
    [MagMax_c1,fundFreq_c1] = featFreq(c1,fs);
    [MagMax_c2,fundFreq_c2] = featFreq(c2,fs);
    [meanFt_c1,stdFt_c1,skewFt_c1,kurFt_c1,rmsFt_c1,medFt_c1,entFt_c1] = featStat(c1); 
    [meanFt_c2,stdFt_c2,skewFt_c2,kurFt_c2,rmsFt_c2,medFt_c2,entFt_c2] = featStat(c2); 

    if num_peaks_c1 >= num_peaks_c2
        feature_vec_test_2s(:,j) = [num_peaks_c2; num_peaks_c1; avg_spacing_c2; avg_spacing_c1;avg_peak_mag_c2;avg_peak_mag_c1; ...
            MagMax_c2; MagMax_c1; fundFreq_c2; fundFreq_c1; ...
            meanFt_c2; meanFt_c1; stdFt_c2; stdFt_c1; skewFt_c2; skewFt_c1; kurFt_c2; kurFt_c1; ...
            rmsFt_c2; rmsFt_c1; medFt_c2; medFt_c1; entFt_c2; entFt_c1]; 
    else 
        feature_vec_test_2s(:,j) = [num_peaks_c1; num_peaks_c2; avg_spacing_c1; avg_spacing_c2;avg_peak_mag_c1;avg_peak_mag_c2; ...
            MagMax_c1; MagMax_c2; fundFreq_c1; fundFreq_c2; ...
            meanFt_c1; meanFt_c2; stdFt_c1; stdFt_c2; skewFt_c1; skewFt_c2; kurFt_c1; kurFt_c2; ...
            rmsFt_c1; rmsFt_c2; medFt_c1; medFt_c2; entFt_c1; entFt_c2];
    end 
    j = j + 1; 
end 

%% Save the data 

%% Create column of gold standard for training
j = 1; 
for k = 1:N_test
    gold_vec_train_2s(j) = r01_train_2s.(strcat('gold_',num2str(k)));
    j = j + 1; 
end 
for k = 1:N_test
    gold_vec_train_2s(j) = r04_train_2s.(strcat('gold_',num2str(k)));
    j = j + 1; 
end 
for k = 1:N_test
    gold_vec_train_2s(j) = r07_train_2s.(strcat('gold_',num2str(k)));
    j = j + 1; 
end 
for k = 1:N_test
    gold_vec_train_2s(j) = r08_train_2s.(strcat('gold_',num2str(k)));
    j = j + 1; 
end 
for k = 1:N_test
    gold_vec_train_2s(j) = r10_train_2s.(strcat('gold_',num2str(k)));
    j = j + 1; 
end 


%% Create column of gold standard for testing
j = 1; 
for k = N_test+1:N
    gold_vec_test_2s(j) = r01_test_2s.(strcat('gold_',num2str(k)));
    j = j + 1; 
end 
for k = N_test+1:N
    gold_vec_test_2s(j) = r04_test_2s.(strcat('gold_',num2str(k)));
    j = j + 1; 
end 
for k = N_test+1:N
    gold_vec_test_2s(j) = r07_test_2s.(strcat('gold_',num2str(k)));
    j = j + 1; 
end 
for k = N_test+1:N
    gold_vec_test_2s(j) = r08_test_2s.(strcat('gold_',num2str(k)));
    j = j + 1; 
end 
for k = N_test+1:N
    gold_vec_test_2s(j) = r10_test_2s.(strcat('gold_',num2str(k)));
    j = j + 1; 
end 

feature_vec_train_2s_temp = feature_vec_train_2s;
gold_vec_train_2s_temp = gold_vec_train_2s;

feature_vec_test_2s_temp = feature_vec_test_2s; 
gold_vec_test_2s_temp = gold_vec_test_2s; 

clear feature_vec_train_2s gold_vec_train_2s feature_vec_test_2s gold_vec_test_2s

[feature_vec_train_2s,gold_vec_train_2s] = removeNans(feature_vec_train_2s_temp,gold_vec_train_2s_temp); 
[feature_vec_test_2s,gold_vec_test_2s] = removeNans(feature_vec_test_2s_temp,gold_vec_test_2s_temp);

save("data_chunked_2s\feature_vec_train_2s","feature_vec_train_2s"); 
save("data_chunked_2s\feature_vec_test_2s","feature_vec_test_2s");
save("data_chunked_2s\gold_vec_train_2s","gold_vec_train_2s"); 
save("data_chunked_2s\gold_vec_test_2s","gold_vec_test_2s");