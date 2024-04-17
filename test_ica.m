% test ICA
[data_r01,anno_r01,info_r01,fs_r01] = read_edf("data/r01.edf");

t1 = 11; 
t2 = 15; 

signum = 3;
fl = 1;  
fh = 70; 
fs = fs_r01(signum); 
N = 1024; 

[t_r01_2,ecg_r01_2] = extract_edf(signum,data_r01,info_r01,fs_r01); 
qrs_t_r01_2 = seconds(anno_r01.Onset); 
r01_2_filtered = bandpassfilter(ecg_r01_2,fl,fh,fs,N); 
[chunck_t_r01_2,chunk_r01_2_filtered,t_qrs_r01_2,qrs_r01_2] = chunk_ecg(t1,t2,t_r01_2,r01_2_filtered,qrs_t_r01_2); 

data_resized = prewhiten(chunk_r01_2_filtered);
numParts = 3;
Mdl = rica(data_resized,numParts)
%Mdl = rica(data_resized, numParts, 'IterationLimit',100)
%mdl_weights = Mdl.TransformWeights;
unmixed = transform(Mdl,data_resized);

comp_1 = unmixed(:,1);
comp_2 = unmixed(:,2);
comp_3 = unmixed(:,3);


% comp_1 = mdl_weights(:,1);
% comp_2 = mdl_weights(:,2);



figure(4)
subplot(4,1,1)
plot(chunck_t_r01_2,chunk_r01_2_filtered,'LineWidth',1) % plotting the chunk of fetal ECG data
title('Original data')

subplot(4,1,2)
plot(chunck_t_r01_2,comp_1,'LineWidth',1) ;
title('Component 1')

subplot(4,1,3)
plot(chunck_t_r01_2,comp_2,'LineWidth',1)
title('Component 2')

subplot(4,1,4)
plot(chunck_t_r01_2,comp_3,'LineWidth',1)
title('Component 3')