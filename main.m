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

% signum values: 1 = invasive, 2 - 5 = abdomen 1 - 4

%% Plot total invasive ECG signal from r01
signum = 1;
[t_r01_1,ecg_r01_1] = extract_edf(signum,data_r01,info_r01,fs_r01); 

qrs_t_r01_1 = seconds(anno_r01.Onset); 
qrs_r01_1 = find_qrs(qrs_t_r01_1,t_r01_1,ecg_r01_1); 

figure(1)
plot(t_r01_1,ecg_r01_1)
hold on 
scatter(qrs_t_r01_1,qrs_r01_1)
xlabel('time (s)'); 
ylabel('ECG Amplitude (mv??)')
title('Original Invasive ECG from r01')


%% Band pass filter the signal from r01 
t1 = 1; 
t2 = 5; 

fl = 3;  
fh = 30; 
fs = fs_r01(signum); 
N = 1024; 

r01_1_filtered = bandpassfilter(ecg_r01_1,fl,fh,fs,N); 

[chunck_t_r01_1,chunk_r01_1_filtered,t_qrs_r01_1,qrs_r01_1] = chunk_ecg(t1,t2,t_r01_1,r01_1_filtered,qrs_t_r01_1); 

% Collect data from materal ECG 1 
signum = 2;
[t_r01_2,ecg_r01_2] = extract_edf(signum,data_r01,info_r01,fs_r01); 
qrs_t_r01_2 = seconds(anno_r01.Onset); 
% qrs_r01_2 = find_qrs(qrs_t_r01_2,t_r01_2,ecg_r01_2);
r01_2_filtered = bandpassfilter(ecg_r01_2,fl,fh,fs,N); 
[chunck_t_r01_2,chunk_r01_2_filtered,t_qrs_r01_2,qrs_r01_2] = chunk_ecg(t1,t2,t_r01_2,r01_2_filtered,qrs_t_r01_2); 

signum = 3;
[t_r01_3,ecg_r01_3] = extract_edf(signum,data_r01,info_r01,fs_r01); 
qrs_t_r01_3 = seconds(anno_r01.Onset); 
% qrs_r01_3 = find_qrs(qrs_t_r01_3,t_r01_3,ecg_r01_3);
r01_3_filtered = bandpassfilter(ecg_r01_3,fl,fh,fs,N); 
[chunck_t_r01_3,chunk_r01_3_filtered,t_qrs_r01_3,qrs_r01_3] = chunk_ecg(t1,t2,t_r01_3,r01_3_filtered,qrs_t_r01_3); 

signum = 4;
[t_r01_4,ecg_r01_4] = extract_edf(signum,data_r01,info_r01,fs_r01); 
qrs_t_r01_4 = seconds(anno_r01.Onset); 
% qrs_r01_4 = find_qrs(qrs_t_r01_4,t_r01_4,ecg_r01_4);
r01_4_filtered = bandpassfilter(ecg_r01_4,fl,fh,fs,N); 
[chunck_t_r01_4,chunk_r01_4_filtered,t_qrs_r01_4,qrs_r01_4] = chunk_ecg(t1,t2,t_r01_4,r01_4_filtered,qrs_t_r01_4); 

signum = 5;
[t_r01_5,ecg_r01_5] = extract_edf(signum,data_r01,info_r01,fs_r01); 
qrs_t_r01_5 = seconds(anno_r01.Onset); 
% qrs_r01_5 = find_qrs(qrs_t_r01_5,t_r01_5,ecg_r01_5);
r01_5_filtered = bandpassfilter(ecg_r01_5,fl,fh,fs,N); 
[chunck_t_r01_5,chunk_r01_5_filtered,t_qrs_r01_5,qrs_r01_5] = chunk_ecg(t1,t2,t_r01_5,r01_5_filtered,qrs_t_r01_5); 



figure(2)
tiledlayout(2,1,"TileSpacing","none"); 

nexttile 
plot(chunck_t_r01_1,chunk_r01_1_filtered,'LineWidth',1)
title('ECG Signal from patient r01')
hold on 
scatter(t_qrs_r01_1,qrs_r01_1,"filled","ColorVariable","red");
legend('Invasive ECG Signal','Fetal QRS Complex Annotation')
ylabel('ECG Amplitude')

nexttile 
 
hold on 
%plot(chunck_t_r01_2,chunk_r01_2_filtered,"LineWidth",1)
plot(chunck_t_r01_3,chunk_r01_3_filtered,"LineWidth",1)
hold on 
plot(chunck_t_r01_4,chunk_r01_4_filtered,"LineWidth",1)
hold on 
plot(chunck_t_r01_5,chunk_r01_5_filtered,"LineWidth",1)
hold on 
yzeros = zeros(length(t_qrs_r01_1),1); 
scatter(t_qrs_r01_1,yzeros,"filled","ColorVariable","red");
xlabel('time (s)'); 
ylabel('ECG Amplitude')
legend('Materal ECG 2','Materal ECG 3','Materal ECG 4','Fetal QRS Complex Annotation')

