% test ICA
[data_r01,anno_r01,info_r01,fs_r01] = read_edf("data/r01.edf");

t1 = 11; 
t2 = 15; 

signum = 3;
fl = 1;  
fh = 70; 
fs = fs_r01(signum); 
N = 1024; 

% Collect data from materal ECG 1 
signum = 2;
[t_r01_2,ecg_r01_2] = extract_edf(signum,data_r01,info_r01,fs_r01); 
qrs_t_r01_2 = seconds(anno_r01.Onset); 
% qrs_r01_2 = find_qrs(qrs_t_r01_2,t_r01_2,ecg_r01_2);
r01_2_filtered = old_bandpassfilter(ecg_r01_2,fl,fh,fs,N); 
[chunck_t_r01_2,chunk_r01_2_filtered,t_qrs_r01_2,qrs_r01_2] = chunk_ecg(t1,t2,t_r01_2,r01_2_filtered,qrs_t_r01_2); 

signum = 3;
[t_r01_3,ecg_r01_3] = extract_edf(signum,data_r01,info_r01,fs_r01); 
qrs_t_r01_3 = seconds(anno_r01.Onset); 
% qrs_r01_3 = find_qrs(qrs_t_r01_3,t_r01_3,ecg_r01_3);
r01_3_filtered = old_bandpassfilter(ecg_r01_3,fl,fh,fs,N); 
[chunck_t_r01_3,chunk_r01_3_filtered,t_qrs_r01_3,qrs_r01_3] = chunk_ecg(t1,t2,t_r01_3,r01_3_filtered,qrs_t_r01_3); 

signum = 4;
[t_r01_4,ecg_r01_4] = extract_edf(signum,data_r01,info_r01,fs_r01); 
qrs_t_r01_4 = seconds(anno_r01.Onset); 
% qrs_r01_4 = find_qrs(qrs_t_r01_4,t_r01_4,ecg_r01_4);
r01_4_filtered = old_bandpassfilter(ecg_r01_4,fl,fh,fs,N); 
[chunck_t_r01_4,chunk_r01_4_filtered,t_qrs_r01_4,qrs_r01_4] = chunk_ecg(t1,t2,t_r01_4,r01_4_filtered,qrs_t_r01_4); 

signum = 5;
[t_r01_5,ecg_r01_5] = extract_edf(signum,data_r01,info_r01,fs_r01); 
qrs_t_r01_5 = seconds(anno_r01.Onset); 
% qrs_r01_5 = find_qrs(qrs_t_r01_5,t_r01_5,ecg_r01_5);
r01_5_filtered = old_bandpassfilter(ecg_r01_5,fl,fh,fs,N); 
[chunck_t_r01_5,chunk_r01_5_filtered,t_qrs_r01_5,qrs_r01_5] = chunk_ecg(t1,t2,t_r01_5,r01_5_filtered,qrs_t_r01_5); 

data = [chunk_r01_2_filtered, chunk_r01_3_filtered, chunk_r01_4_filtered, chunk_r01_5_filtered];

data_white = prewhiten(data);
numParts = 3;
Mdl = rica(data_white,numParts)
%Mdl = rica(data_resized, numParts, 'IterationLimit',100)
%mdl_weights = Mdl.TransformWeights;
unmixed = transform(Mdl,data_white);

comp_1 = unmixed(:,1);
comp_2 = unmixed(:,2);
comp_3 = unmixed(:,3);


% comp_1 = mdl_weights(:,1);
% comp_2 = mdl_weights(:,2);

%% Plot total invasive ECG signal from r01
signum = 1;
[t_r01_1,ecg_r01_1] = extract_edf(signum,data_r01,info_r01,fs_r01); 

qrs_t_r01_1 = seconds(anno_r01.Onset); 
qrs_r01_1 = find_qrs(qrs_t_r01_1,t_r01_1,ecg_r01_1); 

ecg_r01_1_filtered = old_bandpassfilter(ecg_r01_1,1,70,fs_r01(signum),1024); 
r01_1_filtered = old_bandpassfilter(ecg_r01_1,fl,fh,fs,N); 

[chunck_t_r01_1,chunk_r01_1_filtered,t_qrs_r01_1,qrs_r01_1] = chunk_ecg(t1,t2,t_r01_1,r01_1_filtered,qrs_t_r01_1)



figure(5)
subplot(5,1,1)
plot(chunck_t_r01_2,chunk_r01_2_filtered,'LineWidth',1) % plotting the chunk of fetal ECG data
title('Original data')

subplot(5,1,2)
plot(chunck_t_r01_2,comp_1,'LineWidth',1) ;
title('Component 1')

subplot(5,1,3)
plot(chunck_t_r01_2,comp_2,'LineWidth',1)
title('Component 2')

subplot(5,1,4)
plot(chunck_t_r01_2,comp_3,'LineWidth',1)
title('Component 3')

subplot(5,1,5);
plot(chunck_t_r01_1,chunk_r01_1_filtered,'LineWidth',1) % plotting the chunk of fetal ECG data
hold on;
scatter()
title('Fetal')