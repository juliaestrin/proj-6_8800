%% Read and plot original data tt
clear all 


% Read data for PC 
[data_r01,anno_r01,info_r01,fs_r01] = read_edf("data/r01.edf");
[data_r04,anno_r04,info_r04,fs_r04] = read_edf("data/r04.edf");
[data_r07,anno_r07,info_r07,fs_r07] = read_edf("data/r07.edf");
[data_r08,anno_r08,info_r08,fs_r08] = read_edf("data/r08.edf");
[data_r10,anno_r10,info_r10,fs_r10] = read_edf("data/r10.edf");

% Read data for MAC 
% [data_r01,anno_r01,info_r01,fs_r01] = read_edf("data\r01.edf");
% [data_r04,anno_r04,info_r04,fs_r04] = read_edf("data\r04.edf");
% [data_r07,anno_r07,info_r07,fs_r07] = read_edf("data\r07.edf");
% [data_r08,anno_r08,info_r08,fs_r08] = read_edf("data\r08.edf");
% [data_r10,anno_r10,info_r10,fs_r10] = read_edf("data\r10.edf");

%%


%% Plot total invasive ECG signal from r01
signum = 1;
[t,y] = extract_edf(signum,data_r01,info_r01,fs_r01); 

qrs_t_r01 = seconds(anno_r01.Onset); 
qrs_r01 = find_qrs(qrs_t_r01,t,y); 

figure(1)
plot(t,y)
hold on 
scatter(qrs_t_r01,qrs_r01)
