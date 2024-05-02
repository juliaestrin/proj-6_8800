% test ICA
[data_r01,anno_r01,info_r01,fs_r01] = read_edf("data/r01.edf");

t1 = 11; 
t2 = 15; 

signum = 3;
fl = 0.1;  
fh = 30;  
fs = fs_r01(signum); 
N = 1024; 

% [t_r01_2,ecg_r01_2] = extract_edf(signum,data_r01,info_r01,fs_r01);
% qrs_t_r01_2 = seconds(anno_r01.Onset); 
% r01_2_filtered = bandpassfilter(ecg_r01_2,fl,fh,fs,N); 
% [chunck_t_r01_2,chunk_r01_2_filtered,t_qrs_r01_2,qrs_r01_2] = chunk_ecg(t1,t2,t_r01_2,r01_2_filtered,qrs_t_r01_2); 

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






data_resized = [prewhiten(chunk_r01_2_filtered),prewhiten(chunk_r01_3_filtered),prewhiten(chunk_r01_4_filtered),prewhiten(chunk_r01_5_filtered)];
data_raw = [chunk_r01_2_filtered,chunk_r01_3_filtered,chunk_r01_4_filtered, chunk_r01_5_filtered];
numParts = 3;
Tdata = data_resized';
[W, Zhat] = ica(Tdata);
%Mdl = rica(data_resized,numParts);
%Mdl = rica(data_resized, numParts, 'IterationLimit',100)
%mdl_weights = Mdl.TransformWeights;
%unmixed = transform(Mdl,data_resized);
unmixed = Zhat';
 comp_1 = unmixed(:,1);
 comp_2 = unmixed(:,2);
 comp_3 = unmixed(:,3);
 comp_4 = unmixed(:,4);

% comp_1 = mdl_weights(:,1);
% comp_2 = mdl_weights(:,2);



figure();
clf
subplot(5,1,1)
plot(chunck_t_r01_2,chunk_r01_2_filtered,'LineWidth',1) % plotting the chunk of fetal ECG data
hold on;
scatter(t_qrs_r01_1,0*qrs_r01_1); 
title('Original data')

subplot(5,1,2)
plot(chunck_t_r01_2,comp_1,'LineWidth',1) 
hold on;
scatter(t_qrs_r01_1,0*qrs_r01_1);
title('Component 1')

subplot(5,1,3)
plot(chunck_t_r01_2,comp_2,'LineWidth',1)
hold on;
scatter(t_qrs_r01_1,0*qrs_r01_1); 
title('Component 2')

subplot(5,1,4)
plot(chunck_t_r01_2,comp_3,'LineWidth',1)
hold on;
scatter(t_qrs_r01_1,0*qrs_r01_1); 
title('Component 3')

subplot(5,1,5)
plot(chunck_t_r01_2,comp_4,'LineWidth',1)
hold on;
scatter(t_qrs_r01_1,0*qrs_r01_1); 
title('Component 4')