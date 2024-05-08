N = 298; 
N_test = floor(N*0.8); 
fs = 1000; 

feature_vec_train_NonICA_2s = [];
feature_vec_test_NonICA_2s = [];

%% Create feature vector for training 
j = 1; 

% training for r01
for k = 1:N_test
    c1 = r01_train_2s.(strcat('ecg2_',num2str(k))); 
    c2 = r01_train_2s.(strcat('ecg3_',num2str(k)));
    c3 = r01_train_2s.(strcat('ecg4_',num2str(k)));
    c4 = r01_train_2s.(strcat('ecg5_',num2str(k)));
    
    [m_num_peaks_c1,f_num_peaks_c1, m_avg_spacing_c1,f_avg_spacing_c1, m_avg_peak_mag_c1,f_avg_peak_mag_c1] = featPeakAbdo(c1,fs);
    [m_num_peaks_c2,f_num_peaks_c2, m_avg_spacing_c2,f_avg_spacing_c2, m_avg_peak_mag_c2,f_avg_peak_mag_c2] = featPeakAbdo(c2,fs);
    [m_num_peaks_c3,f_num_peaks_c3, m_avg_spacing_c3,f_avg_spacing_c3, m_avg_peak_mag_c3,f_avg_peak_mag_c3] = featPeakAbdo(c3,fs);
    [m_num_peaks_c4,f_num_peaks_c4, m_avg_spacing_c4,f_avg_spacing_c4, m_avg_peak_mag_c4,f_avg_peak_mag_c4] = featPeakAbdo(c4,fs);


%     [num_peaks_c1, avg_spacing_c1, avg_peak_mag_c1] = featPeak(c1,fs);
%     [num_peaks_c2, avg_spacing_c2, avg_peak_mag_c2] = featPeak(c2,fs);
%     [num_peaks_c3, avg_spacing_c3, avg_peak_mag_c3] = featPeak(c3,fs);
%     [num_peaks_c4, avg_spacing_c4, avg_peak_mag_c4] = featPeak(c4,fs);

    [MagMax_c1,fundFreq_c1] = featFreq(c1,fs);
    [MagMax_c2,fundFreq_c2] = featFreq(c2,fs);
    [MagMax_c3,fundFreq_c3] = featFreq(c3,fs);
    [MagMax_c4,fundFreq_c4] = featFreq(c4,fs);

    [meanFt_c1,stdFt_c1,skewFt_c1,kurFt_c1,rmsFt_c1,medFt_c1,entFt_c1] = featStat(c1); 
    [meanFt_c2,stdFt_c2,skewFt_c2,kurFt_c2,rmsFt_c2,medFt_c2,entFt_c2] = featStat(c2); 
    [meanFt_c3,stdFt_c3,skewFt_c3,kurFt_c3,rmsFt_c3,medFt_c3,entFt_c3] = featStat(c3); 
    [meanFt_c4,stdFt_c4,skewFt_c4,kurFt_c4,rmsFt_c4,medFt_c4,entFt_c4] = featStat(c4); 

    feature_vec_train_NonICA_2s(:,j) = ...
        [m_num_peaks_c1; m_num_peaks_c2; m_num_peaks_c3; m_num_peaks_c4; ...         
        f_num_peaks_c1; f_num_peaks_c2; f_num_peaks_c3; f_num_peaks_c4; ...
        m_avg_spacing_c1; m_avg_spacing_c2; m_avg_spacing_c3; m_avg_spacing_c4;...         
        f_avg_spacing_c1; f_avg_spacing_c2; f_avg_spacing_c3; f_avg_spacing_c4;...
        m_avg_peak_mag_c1; m_avg_peak_mag_c2; m_avg_peak_mag_c3; m_avg_peak_mag_c4; ...         
        f_avg_peak_mag_c1; f_avg_peak_mag_c2; f_avg_peak_mag_c3; f_avg_peak_mag_c4; ...
        MagMax_c1; MagMax_c2; MagMax_c3; MagMax_c4; ...
        fundFreq_c1; fundFreq_c2; fundFreq_c3; fundFreq_c4; ...
        meanFt_c1; meanFt_c2; meanFt_c3; meanFt_c4; ...
        stdFt_c1; stdFt_c2; stdFt_c3; stdFt_c4; ...
        skewFt_c1; skewFt_c2; skewFt_c3; skewFt_c4; ...
        kurFt_c1; kurFt_c2; kurFt_c3; kurFt_c4; ...
        rmsFt_c1; rmsFt_c2; rmsFt_c3; rmsFt_c4; ...
        medFt_c1; medFt_c2; medFt_c3; medFt_c4;
        entFt_c1; entFt_c2; entFt_c3; entFt_c4]; 
    j = j + 1; 
end 

% r04
for k = 1:N_test
    c1 = r04_train_2s.(strcat('ecg2_',num2str(k))); 
    c2 = r04_train_2s.(strcat('ecg3_',num2str(k)));
    c3 = r04_train_2s.(strcat('ecg4_',num2str(k)));
    c4 = r04_train_2s.(strcat('ecg5_',num2str(k)));

    [m_num_peaks_c1,f_num_peaks_c1, m_avg_spacing_c1,f_avg_spacing_c1, m_avg_peak_mag_c1,f_avg_peak_mag_c1] = featPeakAbdo(c1,fs);
    [m_num_peaks_c2,f_num_peaks_c2, m_avg_spacing_c2,f_avg_spacing_c2, m_avg_peak_mag_c2,f_avg_peak_mag_c2] = featPeakAbdo(c2,fs);
    [m_num_peaks_c3,f_num_peaks_c3, m_avg_spacing_c3,f_avg_spacing_c3, m_avg_peak_mag_c3,f_avg_peak_mag_c3] = featPeakAbdo(c3,fs);
    [m_num_peaks_c4,f_num_peaks_c4, m_avg_spacing_c4,f_avg_spacing_c4, m_avg_peak_mag_c4,f_avg_peak_mag_c4] = featPeakAbdo(c4,fs);

    [MagMax_c1,fundFreq_c1] = featFreq(c1,fs);
    [MagMax_c2,fundFreq_c2] = featFreq(c2,fs);
    [MagMax_c3,fundFreq_c3] = featFreq(c3,fs);
    [MagMax_c4,fundFreq_c4] = featFreq(c4,fs);

    [meanFt_c1,stdFt_c1,skewFt_c1,kurFt_c1,rmsFt_c1,medFt_c1,entFt_c1] = featStat(c1); 
    [meanFt_c2,stdFt_c2,skewFt_c2,kurFt_c2,rmsFt_c2,medFt_c2,entFt_c2] = featStat(c2); 
    [meanFt_c3,stdFt_c3,skewFt_c3,kurFt_c3,rmsFt_c3,medFt_c3,entFt_c3] = featStat(c3); 
    [meanFt_c4,stdFt_c4,skewFt_c4,kurFt_c4,rmsFt_c4,medFt_c4,entFt_c4] = featStat(c4); 

    feature_vec_train_NonICA_2s(:,j) = ...
        [m_num_peaks_c1; m_num_peaks_c2; m_num_peaks_c3; m_num_peaks_c4; ...         
        f_num_peaks_c1; f_num_peaks_c2; f_num_peaks_c3; f_num_peaks_c4; ...
        m_avg_spacing_c1; m_avg_spacing_c2; m_avg_spacing_c3; m_avg_spacing_c4;...         
        f_avg_spacing_c1; f_avg_spacing_c2; f_avg_spacing_c3; f_avg_spacing_c4;...
        m_avg_peak_mag_c1; m_avg_peak_mag_c2; m_avg_peak_mag_c3; m_avg_peak_mag_c4; ...         
        f_avg_peak_mag_c1; f_avg_peak_mag_c2; f_avg_peak_mag_c3; f_avg_peak_mag_c4; ...
        MagMax_c1; MagMax_c2; MagMax_c3; MagMax_c4; ...
        fundFreq_c1; fundFreq_c2; fundFreq_c3; fundFreq_c4; ...
        meanFt_c1; meanFt_c2; meanFt_c3; meanFt_c4; ...
        stdFt_c1; stdFt_c2; stdFt_c3; stdFt_c4; ...
        skewFt_c1; skewFt_c2; skewFt_c3; skewFt_c4; ...
        kurFt_c1; kurFt_c2; kurFt_c3; kurFt_c4; ...
        rmsFt_c1; rmsFt_c2; rmsFt_c3; rmsFt_c4; ...
        medFt_c1; medFt_c2; medFt_c3; medFt_c4;
        entFt_c1; entFt_c2; entFt_c3; entFt_c4]; 
    j = j + 1; 
end 

% r07
for k = 1:N_test
    c1 = r07_train_2s.(strcat('ecg2_',num2str(k))); 
    c2 = r07_train_2s.(strcat('ecg3_',num2str(k)));
    c3 = r07_train_2s.(strcat('ecg4_',num2str(k)));
    c4 = r07_train_2s.(strcat('ecg5_',num2str(k)));

    [m_num_peaks_c1,f_num_peaks_c1, m_avg_spacing_c1,f_avg_spacing_c1, m_avg_peak_mag_c1,f_avg_peak_mag_c1] = featPeakAbdo(c1,fs);
    [m_num_peaks_c2,f_num_peaks_c2, m_avg_spacing_c2,f_avg_spacing_c2, m_avg_peak_mag_c2,f_avg_peak_mag_c2] = featPeakAbdo(c2,fs);
    [m_num_peaks_c3,f_num_peaks_c3, m_avg_spacing_c3,f_avg_spacing_c3, m_avg_peak_mag_c3,f_avg_peak_mag_c3] = featPeakAbdo(c3,fs);
    [m_num_peaks_c4,f_num_peaks_c4, m_avg_spacing_c4,f_avg_spacing_c4, m_avg_peak_mag_c4,f_avg_peak_mag_c4] = featPeakAbdo(c4,fs);

    [MagMax_c1,fundFreq_c1] = featFreq(c1,fs);
    [MagMax_c2,fundFreq_c2] = featFreq(c2,fs);
    [MagMax_c3,fundFreq_c3] = featFreq(c3,fs);
    [MagMax_c4,fundFreq_c4] = featFreq(c4,fs);

    [meanFt_c1,stdFt_c1,skewFt_c1,kurFt_c1,rmsFt_c1,medFt_c1,entFt_c1] = featStat(c1); 
    [meanFt_c2,stdFt_c2,skewFt_c2,kurFt_c2,rmsFt_c2,medFt_c2,entFt_c2] = featStat(c2); 
    [meanFt_c3,stdFt_c3,skewFt_c3,kurFt_c3,rmsFt_c3,medFt_c3,entFt_c3] = featStat(c3); 
    [meanFt_c4,stdFt_c4,skewFt_c4,kurFt_c4,rmsFt_c4,medFt_c4,entFt_c4] = featStat(c4); 

    feature_vec_train_NonICA_2s(:,j) = ...
        [m_num_peaks_c1; m_num_peaks_c2; m_num_peaks_c3; m_num_peaks_c4; ...         
        f_num_peaks_c1; f_num_peaks_c2; f_num_peaks_c3; f_num_peaks_c4; ...
        m_avg_spacing_c1; m_avg_spacing_c2; m_avg_spacing_c3; m_avg_spacing_c4;...        
        f_avg_spacing_c1; f_avg_spacing_c2; f_avg_spacing_c3; f_avg_spacing_c4;...
        m_avg_peak_mag_c1; m_avg_peak_mag_c2; m_avg_peak_mag_c3; m_avg_peak_mag_c4; ...       
        f_avg_peak_mag_c1; f_avg_peak_mag_c2; f_avg_peak_mag_c3; f_avg_peak_mag_c4; ...
        MagMax_c1; MagMax_c2; MagMax_c3; MagMax_c4; ...
        fundFreq_c1; fundFreq_c2; fundFreq_c3; fundFreq_c4; ...
        meanFt_c1; meanFt_c2; meanFt_c3; meanFt_c4; ...
        stdFt_c1; stdFt_c2; stdFt_c3; stdFt_c4; ...
        skewFt_c1; skewFt_c2; skewFt_c3; skewFt_c4; ...
        kurFt_c1; kurFt_c2; kurFt_c3; kurFt_c4; ...
        rmsFt_c1; rmsFt_c2; rmsFt_c3; rmsFt_c4; ...
        medFt_c1; medFt_c2; medFt_c3; medFt_c4;
        entFt_c1; entFt_c2; entFt_c3; entFt_c4]; 
    j = j + 1; 
end 

% r08
for k = 1:N_test
    c1 = r08_train_2s.(strcat('ecg2_',num2str(k))); 
    c2 = r08_train_2s.(strcat('ecg3_',num2str(k)));
    c3 = r08_train_2s.(strcat('ecg4_',num2str(k)));
    c4 = r08_train_2s.(strcat('ecg5_',num2str(k)));

    [m_num_peaks_c1,f_num_peaks_c1, m_avg_spacing_c1,f_avg_spacing_c1, m_avg_peak_mag_c1,f_avg_peak_mag_c1] = featPeakAbdo(c1,fs);
    [m_num_peaks_c2,f_num_peaks_c2, m_avg_spacing_c2,f_avg_spacing_c2, m_avg_peak_mag_c2,f_avg_peak_mag_c2] = featPeakAbdo(c2,fs);
    [m_num_peaks_c3,f_num_peaks_c3, m_avg_spacing_c3,f_avg_spacing_c3, m_avg_peak_mag_c3,f_avg_peak_mag_c3] = featPeakAbdo(c3,fs);
    [m_num_peaks_c4,f_num_peaks_c4, m_avg_spacing_c4,f_avg_spacing_c4, m_avg_peak_mag_c4,f_avg_peak_mag_c4] = featPeakAbdo(c4,fs);

    [MagMax_c1,fundFreq_c1] = featFreq(c1,fs);
    [MagMax_c2,fundFreq_c2] = featFreq(c2,fs);
    [MagMax_c3,fundFreq_c3] = featFreq(c3,fs);
    [MagMax_c4,fundFreq_c4] = featFreq(c4,fs);

    [meanFt_c1,stdFt_c1,skewFt_c1,kurFt_c1,rmsFt_c1,medFt_c1,entFt_c1] = featStat(c1); 
    [meanFt_c2,stdFt_c2,skewFt_c2,kurFt_c2,rmsFt_c2,medFt_c2,entFt_c2] = featStat(c2); 
    [meanFt_c3,stdFt_c3,skewFt_c3,kurFt_c3,rmsFt_c3,medFt_c3,entFt_c3] = featStat(c3); 
    [meanFt_c4,stdFt_c4,skewFt_c4,kurFt_c4,rmsFt_c4,medFt_c4,entFt_c4] = featStat(c4); 

    feature_vec_train_NonICA_2s(:,j) = ...
        [m_num_peaks_c1; m_num_peaks_c2; m_num_peaks_c3; m_num_peaks_c4; ...         
        f_num_peaks_c1; f_num_peaks_c2; f_num_peaks_c3; f_num_peaks_c4; ...
        m_avg_spacing_c1; m_avg_spacing_c2; m_avg_spacing_c3; m_avg_spacing_c4;...       
        f_avg_spacing_c1; f_avg_spacing_c2; f_avg_spacing_c3; f_avg_spacing_c4;...
        m_avg_peak_mag_c1; m_avg_peak_mag_c2; m_avg_peak_mag_c3; m_avg_peak_mag_c4; ...      
        f_avg_peak_mag_c1; f_avg_peak_mag_c2; f_avg_peak_mag_c3; f_avg_peak_mag_c4; ...
        MagMax_c1; MagMax_c2; MagMax_c3; MagMax_c4; ...
        fundFreq_c1; fundFreq_c2; fundFreq_c3; fundFreq_c4; ...
        meanFt_c1; meanFt_c2; meanFt_c3; meanFt_c4; ...
        stdFt_c1; stdFt_c2; stdFt_c3; stdFt_c4; ...
        skewFt_c1; skewFt_c2; skewFt_c3; skewFt_c4; ...
        kurFt_c1; kurFt_c2; kurFt_c3; kurFt_c4; ...
        rmsFt_c1; rmsFt_c2; rmsFt_c3; rmsFt_c4; ...
        medFt_c1; medFt_c2; medFt_c3; medFt_c4;
        entFt_c1; entFt_c2; entFt_c3; entFt_c4]; 
    j = j + 1; 
end 

% r10
for k = 1:N_test
    c1 = r10_train_2s.(strcat('ecg2_',num2str(k))); 
    c2 = r10_train_2s.(strcat('ecg3_',num2str(k)));
    c3 = r10_train_2s.(strcat('ecg4_',num2str(k)));
    c4 = r10_train_2s.(strcat('ecg5_',num2str(k)));

    [m_num_peaks_c1,f_num_peaks_c1, m_avg_spacing_c1,f_avg_spacing_c1, m_avg_peak_mag_c1,f_avg_peak_mag_c1] = featPeakAbdo(c1,fs);
    [m_num_peaks_c2,f_num_peaks_c2, m_avg_spacing_c2,f_avg_spacing_c2, m_avg_peak_mag_c2,f_avg_peak_mag_c2] = featPeakAbdo(c2,fs);
    [m_num_peaks_c3,f_num_peaks_c3, m_avg_spacing_c3,f_avg_spacing_c3, m_avg_peak_mag_c3,f_avg_peak_mag_c3] = featPeakAbdo(c3,fs);
    [m_num_peaks_c4,f_num_peaks_c4, m_avg_spacing_c4,f_avg_spacing_c4, m_avg_peak_mag_c4,f_avg_peak_mag_c4] = featPeakAbdo(c4,fs);

    [MagMax_c1,fundFreq_c1] = featFreq(c1,fs);
    [MagMax_c2,fundFreq_c2] = featFreq(c2,fs);
    [MagMax_c3,fundFreq_c3] = featFreq(c3,fs);
    [MagMax_c4,fundFreq_c4] = featFreq(c4,fs);

    [meanFt_c1,stdFt_c1,skewFt_c1,kurFt_c1,rmsFt_c1,medFt_c1,entFt_c1] = featStat(c1); 
    [meanFt_c2,stdFt_c2,skewFt_c2,kurFt_c2,rmsFt_c2,medFt_c2,entFt_c2] = featStat(c2); 
    [meanFt_c3,stdFt_c3,skewFt_c3,kurFt_c3,rmsFt_c3,medFt_c3,entFt_c3] = featStat(c3); 
    [meanFt_c4,stdFt_c4,skewFt_c4,kurFt_c4,rmsFt_c4,medFt_c4,entFt_c4] = featStat(c4); 

    feature_vec_train_NonICA_2s(:,j) = ...
        [m_num_peaks_c1; m_num_peaks_c2; m_num_peaks_c3; m_num_peaks_c4; ...      
        f_num_peaks_c1; f_num_peaks_c2; f_num_peaks_c3; f_num_peaks_c4; ...
        m_avg_spacing_c1; m_avg_spacing_c2; m_avg_spacing_c3; m_avg_spacing_c4;...     
        f_avg_spacing_c1; f_avg_spacing_c2; f_avg_spacing_c3; f_avg_spacing_c4;...
        m_avg_peak_mag_c1; m_avg_peak_mag_c2; m_avg_peak_mag_c3; m_avg_peak_mag_c4; ...      
        f_avg_peak_mag_c1; f_avg_peak_mag_c2; f_avg_peak_mag_c3; f_avg_peak_mag_c4; ...
        MagMax_c1; MagMax_c2; MagMax_c3; MagMax_c4; ...
        fundFreq_c1; fundFreq_c2; fundFreq_c3; fundFreq_c4; ...
        meanFt_c1; meanFt_c2; meanFt_c3; meanFt_c4; ...
        stdFt_c1; stdFt_c2; stdFt_c3; stdFt_c4; ...
        skewFt_c1; skewFt_c2; skewFt_c3; skewFt_c4; ...
        kurFt_c1; kurFt_c2; kurFt_c3; kurFt_c4; ...
        rmsFt_c1; rmsFt_c2; rmsFt_c3; rmsFt_c4; ...
        medFt_c1; medFt_c2; medFt_c3; medFt_c4;
        entFt_c1; entFt_c2; entFt_c3; entFt_c4]; 
    j = j + 1; 
end 
%% Create feature vector for testing 
j = 1; 

% test features from r01 
for k = N_test+1:N
    c1 = r01_test_2s.(strcat('ecg2_',num2str(k))); 
    c2 = r01_test_2s.(strcat('ecg3_',num2str(k)));
    c3 = r01_test_2s.(strcat('ecg4_',num2str(k)));
    c4 = r01_test_2s.(strcat('ecg5_',num2str(k)));

    [m_num_peaks_c1,f_num_peaks_c1, m_avg_spacing_c1,f_avg_spacing_c1, m_avg_peak_mag_c1,f_avg_peak_mag_c1] = featPeakAbdo(c1,fs);
    [m_num_peaks_c2,f_num_peaks_c2, m_avg_spacing_c2,f_avg_spacing_c2, m_avg_peak_mag_c2,f_avg_peak_mag_c2] = featPeakAbdo(c2,fs);
    [m_num_peaks_c3,f_num_peaks_c3, m_avg_spacing_c3,f_avg_spacing_c3, m_avg_peak_mag_c3,f_avg_peak_mag_c3] = featPeakAbdo(c3,fs);
    [m_num_peaks_c4,f_num_peaks_c4, m_avg_spacing_c4,f_avg_spacing_c4, m_avg_peak_mag_c4,f_avg_peak_mag_c4] = featPeakAbdo(c4,fs);

    [MagMax_c1,fundFreq_c1] = featFreq(c1,fs);
    [MagMax_c2,fundFreq_c2] = featFreq(c2,fs);
    [MagMax_c3,fundFreq_c3] = featFreq(c3,fs);
    [MagMax_c4,fundFreq_c4] = featFreq(c4,fs);

    [meanFt_c1,stdFt_c1,skewFt_c1,kurFt_c1,rmsFt_c1,medFt_c1,entFt_c1] = featStat(c1); 
    [meanFt_c2,stdFt_c2,skewFt_c2,kurFt_c2,rmsFt_c2,medFt_c2,entFt_c2] = featStat(c2); 
    [meanFt_c3,stdFt_c3,skewFt_c3,kurFt_c3,rmsFt_c3,medFt_c3,entFt_c3] = featStat(c3); 
    [meanFt_c4,stdFt_c4,skewFt_c4,kurFt_c4,rmsFt_c4,medFt_c4,entFt_c4] = featStat(c4); 

    feature_vec_test_NonICA_2s(:,j) = ...
        [m_num_peaks_c1; m_num_peaks_c2; m_num_peaks_c3; m_num_peaks_c4; ...       
        f_num_peaks_c1; f_num_peaks_c2; f_num_peaks_c3; f_num_peaks_c4; ...
        m_avg_spacing_c1; m_avg_spacing_c2; m_avg_spacing_c3; m_avg_spacing_c4;...      
        f_avg_spacing_c1; f_avg_spacing_c2; f_avg_spacing_c3; f_avg_spacing_c4;...
        m_avg_peak_mag_c1; m_avg_peak_mag_c2; m_avg_peak_mag_c3; m_avg_peak_mag_c4; ...    
        f_avg_peak_mag_c1; f_avg_peak_mag_c2; f_avg_peak_mag_c3; f_avg_peak_mag_c4; ...
        MagMax_c1; MagMax_c2; MagMax_c3; MagMax_c4; ...
        fundFreq_c1; fundFreq_c2; fundFreq_c3; fundFreq_c4; ...
        meanFt_c1; meanFt_c2; meanFt_c3; meanFt_c4; ...
        stdFt_c1; stdFt_c2; stdFt_c3; stdFt_c4; ...
        skewFt_c1; skewFt_c2; skewFt_c3; skewFt_c4; ...
        kurFt_c1; kurFt_c2; kurFt_c3; kurFt_c4; ...
        rmsFt_c1; rmsFt_c2; rmsFt_c3; rmsFt_c4; ...
        medFt_c1; medFt_c2; medFt_c3; medFt_c4;
        entFt_c1; entFt_c2; entFt_c3; entFt_c4]; 
    j = j + 1; 
end 

% test features from r04 
for k = N_test+1:N
    c1 = r04_test_2s.(strcat('ecg2_',num2str(k))); 
    c2 = r04_test_2s.(strcat('ecg3_',num2str(k)));
    c3 = r04_test_2s.(strcat('ecg4_',num2str(k)));
    c4 = r04_test_2s.(strcat('ecg5_',num2str(k)));

    [m_num_peaks_c1,f_num_peaks_c1, m_avg_spacing_c1,f_avg_spacing_c1, m_avg_peak_mag_c1,f_avg_peak_mag_c1] = featPeakAbdo(c1,fs);
    [m_num_peaks_c2,f_num_peaks_c2, m_avg_spacing_c2,f_avg_spacing_c2, m_avg_peak_mag_c2,f_avg_peak_mag_c2] = featPeakAbdo(c2,fs);
    [m_num_peaks_c3,f_num_peaks_c3, m_avg_spacing_c3,f_avg_spacing_c3, m_avg_peak_mag_c3,f_avg_peak_mag_c3] = featPeakAbdo(c3,fs);
    [m_num_peaks_c4,f_num_peaks_c4, m_avg_spacing_c4,f_avg_spacing_c4, m_avg_peak_mag_c4,f_avg_peak_mag_c4] = featPeakAbdo(c4,fs);

    [MagMax_c1,fundFreq_c1] = featFreq(c1,fs);
    [MagMax_c2,fundFreq_c2] = featFreq(c2,fs);
    [MagMax_c3,fundFreq_c3] = featFreq(c3,fs);
    [MagMax_c4,fundFreq_c4] = featFreq(c4,fs);

    [meanFt_c1,stdFt_c1,skewFt_c1,kurFt_c1,rmsFt_c1,medFt_c1,entFt_c1] = featStat(c1); 
    [meanFt_c2,stdFt_c2,skewFt_c2,kurFt_c2,rmsFt_c2,medFt_c2,entFt_c2] = featStat(c2); 
    [meanFt_c3,stdFt_c3,skewFt_c3,kurFt_c3,rmsFt_c3,medFt_c3,entFt_c3] = featStat(c3); 
    [meanFt_c4,stdFt_c4,skewFt_c4,kurFt_c4,rmsFt_c4,medFt_c4,entFt_c4] = featStat(c4); 

    feature_vec_test_NonICA_2s(:,j) = ...
        [m_num_peaks_c1; m_num_peaks_c2; m_num_peaks_c3; m_num_peaks_c4; ...       
        f_num_peaks_c1; f_num_peaks_c2; f_num_peaks_c3; f_num_peaks_c4; ...
        m_avg_spacing_c1; m_avg_spacing_c2; m_avg_spacing_c3; m_avg_spacing_c4;...     
        f_avg_spacing_c1; f_avg_spacing_c2; f_avg_spacing_c3; f_avg_spacing_c4;...
        m_avg_peak_mag_c1; m_avg_peak_mag_c2; m_avg_peak_mag_c3; m_avg_peak_mag_c4; ...    
        f_avg_peak_mag_c1; f_avg_peak_mag_c2; f_avg_peak_mag_c3; f_avg_peak_mag_c4; ...
        MagMax_c1; MagMax_c2; MagMax_c3; MagMax_c4; ...
        fundFreq_c1; fundFreq_c2; fundFreq_c3; fundFreq_c4; ...
        meanFt_c1; meanFt_c2; meanFt_c3; meanFt_c4; ...
        stdFt_c1; stdFt_c2; stdFt_c3; stdFt_c4; ...
        skewFt_c1; skewFt_c2; skewFt_c3; skewFt_c4; ...
        kurFt_c1; kurFt_c2; kurFt_c3; kurFt_c4; ...
        rmsFt_c1; rmsFt_c2; rmsFt_c3; rmsFt_c4; ...
        medFt_c1; medFt_c2; medFt_c3; medFt_c4;
        entFt_c1; entFt_c2; entFt_c3; entFt_c4]; 
    j = j + 1; 
end 

% test features from r07 
for k = N_test+1:N
    c1 = r07_test_2s.(strcat('ecg2_',num2str(k))); 
    c2 = r07_test_2s.(strcat('ecg3_',num2str(k)));
    c3 = r07_test_2s.(strcat('ecg4_',num2str(k)));
    c4 = r07_test_2s.(strcat('ecg5_',num2str(k)));

    [m_num_peaks_c1,f_num_peaks_c1, m_avg_spacing_c1,f_avg_spacing_c1, m_avg_peak_mag_c1,f_avg_peak_mag_c1] = featPeakAbdo(c1,fs);
    [m_num_peaks_c2,f_num_peaks_c2, m_avg_spacing_c2,f_avg_spacing_c2, m_avg_peak_mag_c2,f_avg_peak_mag_c2] = featPeakAbdo(c2,fs);
    [m_num_peaks_c3,f_num_peaks_c3, m_avg_spacing_c3,f_avg_spacing_c3, m_avg_peak_mag_c3,f_avg_peak_mag_c3] = featPeakAbdo(c3,fs);
    [m_num_peaks_c4,f_num_peaks_c4, m_avg_spacing_c4,f_avg_spacing_c4, m_avg_peak_mag_c4,f_avg_peak_mag_c4] = featPeakAbdo(c4,fs);

    [MagMax_c1,fundFreq_c1] = featFreq(c1,fs);
    [MagMax_c2,fundFreq_c2] = featFreq(c2,fs);
    [MagMax_c3,fundFreq_c3] = featFreq(c3,fs);
    [MagMax_c4,fundFreq_c4] = featFreq(c4,fs);

    [meanFt_c1,stdFt_c1,skewFt_c1,kurFt_c1,rmsFt_c1,medFt_c1,entFt_c1] = featStat(c1); 
    [meanFt_c2,stdFt_c2,skewFt_c2,kurFt_c2,rmsFt_c2,medFt_c2,entFt_c2] = featStat(c2); 
    [meanFt_c3,stdFt_c3,skewFt_c3,kurFt_c3,rmsFt_c3,medFt_c3,entFt_c3] = featStat(c3); 
    [meanFt_c4,stdFt_c4,skewFt_c4,kurFt_c4,rmsFt_c4,medFt_c4,entFt_c4] = featStat(c4); 

    feature_vec_test_NonICA_2s(:,j) = ...
        [m_num_peaks_c1; m_num_peaks_c2; m_num_peaks_c3; m_num_peaks_c4; ...        
        f_num_peaks_c1; f_num_peaks_c2; f_num_peaks_c3; f_num_peaks_c4; ...
        m_avg_spacing_c1; m_avg_spacing_c2; m_avg_spacing_c3; m_avg_spacing_c4;...       
        f_avg_spacing_c1; f_avg_spacing_c2; f_avg_spacing_c3; f_avg_spacing_c4;...
        m_avg_peak_mag_c1; m_avg_peak_mag_c2; m_avg_peak_mag_c3; m_avg_peak_mag_c4; ...      
        f_avg_peak_mag_c1; f_avg_peak_mag_c2; f_avg_peak_mag_c3; f_avg_peak_mag_c4; ...
        MagMax_c1; MagMax_c2; MagMax_c3; MagMax_c4; ...
        fundFreq_c1; fundFreq_c2; fundFreq_c3; fundFreq_c4; ...
        meanFt_c1; meanFt_c2; meanFt_c3; meanFt_c4; ...
        stdFt_c1; stdFt_c2; stdFt_c3; stdFt_c4; ...
        skewFt_c1; skewFt_c2; skewFt_c3; skewFt_c4; ...
        kurFt_c1; kurFt_c2; kurFt_c3; kurFt_c4; ...
        rmsFt_c1; rmsFt_c2; rmsFt_c3; rmsFt_c4; ...
        medFt_c1; medFt_c2; medFt_c3; medFt_c4;
        entFt_c1; entFt_c2; entFt_c3; entFt_c4]; 
    j = j + 1; 
end 

% test features from r08 
for k = N_test+1:N
    c1 = r08_test_2s.(strcat('ecg2_',num2str(k))); 
    c2 = r08_test_2s.(strcat('ecg3_',num2str(k)));
    c3 = r08_test_2s.(strcat('ecg4_',num2str(k)));
    c4 = r08_test_2s.(strcat('ecg5_',num2str(k)));

    [m_num_peaks_c1,f_num_peaks_c1, m_avg_spacing_c1,f_avg_spacing_c1, m_avg_peak_mag_c1,f_avg_peak_mag_c1] = featPeakAbdo(c1,fs);
    [m_num_peaks_c2,f_num_peaks_c2, m_avg_spacing_c2,f_avg_spacing_c2, m_avg_peak_mag_c2,f_avg_peak_mag_c2] = featPeakAbdo(c2,fs);
    [m_num_peaks_c3,f_num_peaks_c3, m_avg_spacing_c3,f_avg_spacing_c3, m_avg_peak_mag_c3,f_avg_peak_mag_c3] = featPeakAbdo(c3,fs);
    [m_num_peaks_c4,f_num_peaks_c4, m_avg_spacing_c4,f_avg_spacing_c4, m_avg_peak_mag_c4,f_avg_peak_mag_c4] = featPeakAbdo(c4,fs);

    [MagMax_c1,fundFreq_c1] = featFreq(c1,fs);
    [MagMax_c2,fundFreq_c2] = featFreq(c2,fs);
    [MagMax_c3,fundFreq_c3] = featFreq(c3,fs);
    [MagMax_c4,fundFreq_c4] = featFreq(c4,fs);

    [meanFt_c1,stdFt_c1,skewFt_c1,kurFt_c1,rmsFt_c1,medFt_c1,entFt_c1] = featStat(c1); 
    [meanFt_c2,stdFt_c2,skewFt_c2,kurFt_c2,rmsFt_c2,medFt_c2,entFt_c2] = featStat(c2); 
    [meanFt_c3,stdFt_c3,skewFt_c3,kurFt_c3,rmsFt_c3,medFt_c3,entFt_c3] = featStat(c3); 
    [meanFt_c4,stdFt_c4,skewFt_c4,kurFt_c4,rmsFt_c4,medFt_c4,entFt_c4] = featStat(c4); 

    feature_vec_test_NonICA_2s(:,j) = ...
        [m_num_peaks_c1; m_num_peaks_c2; m_num_peaks_c3; m_num_peaks_c4; ...        
        f_num_peaks_c1; f_num_peaks_c2; f_num_peaks_c3; f_num_peaks_c4; ...
        m_avg_spacing_c1; m_avg_spacing_c2; m_avg_spacing_c3; m_avg_spacing_c4;...      
        f_avg_spacing_c1; f_avg_spacing_c2; f_avg_spacing_c3; f_avg_spacing_c4;...
        m_avg_peak_mag_c1; m_avg_peak_mag_c2; m_avg_peak_mag_c3; m_avg_peak_mag_c4; ...      
        f_avg_peak_mag_c1; f_avg_peak_mag_c2; f_avg_peak_mag_c3; f_avg_peak_mag_c4; ...
        MagMax_c1; MagMax_c2; MagMax_c3; MagMax_c4; ...
        fundFreq_c1; fundFreq_c2; fundFreq_c3; fundFreq_c4; ...
        meanFt_c1; meanFt_c2; meanFt_c3; meanFt_c4; ...
        stdFt_c1; stdFt_c2; stdFt_c3; stdFt_c4; ...
        skewFt_c1; skewFt_c2; skewFt_c3; skewFt_c4; ...
        kurFt_c1; kurFt_c2; kurFt_c3; kurFt_c4; ...
        rmsFt_c1; rmsFt_c2; rmsFt_c3; rmsFt_c4; ...
        medFt_c1; medFt_c2; medFt_c3; medFt_c4;
        entFt_c1; entFt_c2; entFt_c3; entFt_c4]; 
    j = j + 1; 
end 

% test features from r10 
for k = N_test+1:N
    c1 = r10_test_2s.(strcat('ecg2_',num2str(k))); 
    c2 = r10_test_2s.(strcat('ecg3_',num2str(k)));
    c3 = r10_test_2s.(strcat('ecg4_',num2str(k)));
    c4 = r10_test_2s.(strcat('ecg5_',num2str(k)));

    [m_num_peaks_c1,f_num_peaks_c1, m_avg_spacing_c1,f_avg_spacing_c1, m_avg_peak_mag_c1,f_avg_peak_mag_c1] = featPeakAbdo(c1,fs);
    [m_num_peaks_c2,f_num_peaks_c2, m_avg_spacing_c2,f_avg_spacing_c2, m_avg_peak_mag_c2,f_avg_peak_mag_c2] = featPeakAbdo(c2,fs);
    [m_num_peaks_c3,f_num_peaks_c3, m_avg_spacing_c3,f_avg_spacing_c3, m_avg_peak_mag_c3,f_avg_peak_mag_c3] = featPeakAbdo(c3,fs);
    [m_num_peaks_c4,f_num_peaks_c4, m_avg_spacing_c4,f_avg_spacing_c4, m_avg_peak_mag_c4,f_avg_peak_mag_c4] = featPeakAbdo(c4,fs);

    [MagMax_c1,fundFreq_c1] = featFreq(c1,fs);
    [MagMax_c2,fundFreq_c2] = featFreq(c2,fs);
    [MagMax_c3,fundFreq_c3] = featFreq(c3,fs);
    [MagMax_c4,fundFreq_c4] = featFreq(c4,fs);

    [meanFt_c1,stdFt_c1,skewFt_c1,kurFt_c1,rmsFt_c1,medFt_c1,entFt_c1] = featStat(c1); 
    [meanFt_c2,stdFt_c2,skewFt_c2,kurFt_c2,rmsFt_c2,medFt_c2,entFt_c2] = featStat(c2); 
    [meanFt_c3,stdFt_c3,skewFt_c3,kurFt_c3,rmsFt_c3,medFt_c3,entFt_c3] = featStat(c3); 
    [meanFt_c4,stdFt_c4,skewFt_c4,kurFt_c4,rmsFt_c4,medFt_c4,entFt_c4] = featStat(c4); 

    feature_vec_test_NonICA_2s(:,j) = ...
        [m_num_peaks_c1; m_num_peaks_c2; m_num_peaks_c3; m_num_peaks_c4; ...       
        f_num_peaks_c1; f_num_peaks_c2; f_num_peaks_c3; f_num_peaks_c4; ...
        m_avg_spacing_c1; m_avg_spacing_c2; m_avg_spacing_c3; m_avg_spacing_c4;...      
        f_avg_spacing_c1; f_avg_spacing_c2; f_avg_spacing_c3; f_avg_spacing_c4;...
        m_avg_peak_mag_c1; m_avg_peak_mag_c2; m_avg_peak_mag_c3; m_avg_peak_mag_c4; ...     
        f_avg_peak_mag_c1; f_avg_peak_mag_c2; f_avg_peak_mag_c3; f_avg_peak_mag_c4; ...
        MagMax_c1; MagMax_c2; MagMax_c3; MagMax_c4; ...
        fundFreq_c1; fundFreq_c2; fundFreq_c3; fundFreq_c4; ...
        meanFt_c1; meanFt_c2; meanFt_c3; meanFt_c4; ...
        stdFt_c1; stdFt_c2; stdFt_c3; stdFt_c4; ...
        skewFt_c1; skewFt_c2; skewFt_c3; skewFt_c4; ...
        kurFt_c1; kurFt_c2; kurFt_c3; kurFt_c4; ...
        rmsFt_c1; rmsFt_c2; rmsFt_c3; rmsFt_c4; ...
        medFt_c1; medFt_c2; medFt_c3; medFt_c4;
        entFt_c1; entFt_c2; entFt_c3; entFt_c4]; 
    j = j + 1; 
end 



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

feature_vec_train_NonICA_2s_temp = feature_vec_train_NonICA_2s;
gold_vec_train_2s_temp = gold_vec_train_2s;

feature_vec_test_NonICA_2s_temp = feature_vec_test_NonICA_2s; 
gold_vec_test_2s_temp = gold_vec_test_2s; 

clear feature_vec_train_NonICA_2s gold_vec_train_2s feature_vec_test_NonICA_2s gold_vec_test_2s

[feature_vec_train_NonICA_2s,gold_vec_train_NonICA_2s] = removeNans(feature_vec_train_NonICA_2s_temp,gold_vec_train_2s_temp); 
[feature_vec_test_NonICA_2s,gold_vec_test_NonICA__2s] = removeNans(feature_vec_test_NonICA_2s_temp,gold_vec_test_2s_temp);

save("data_chunked_2s\feature_vec_train_NonICA_2s","feature_vec_train_NonICA_2s"); 
save("data_chunked_2s\feature_vec_test_NonICA_2s","feature_vec_test_NonICA_2s");
save("data_chunked_2s\gold_vec_train_2s","gold_vec_train_NonICA_2s"); 
save("data_chunked_2s\gold_vec_test_2s","gold_vec_test_NonICA__2s");