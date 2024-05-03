%% Read in the edf data files 
[data_r01,anno_r01,info_r01,fs_r01] = read_edf("data/r01.edf");
[data_r04,anno_r04,info_r04,fs_r04] = read_edf("data/r04.edf");
[data_r07,anno_r07,info_r07,fs_r07] = read_edf("data/r07.edf");
[data_r08,anno_r08,info_r08,fs_r08] = read_edf("data/r08.edf");
[data_r10,anno_r10,info_r10,fs_r10] = read_edf("data/r10.edf");

%% Extract the ECG Signals + fetal R-peak annotation 

% Extract the ECG signals from the timetable into an array 
for i = 1:5 
    signum = i;
    [t_r01(:,i),ecg_r01(:,i)] = extract_edf(signum,data_r01,info_r01,fs_r01);
    [t_r04(:,i),ecg_r04(:,i)] = extract_edf(signum,data_r04,info_r04,fs_r04);
    [t_r07(:,i),ecg_r07(:,i)] = extract_edf(signum,data_r07,info_r07,fs_r07);
    [t_r08(:,i),ecg_r08(:,i)] = extract_edf(signum,data_r08,info_r08,fs_r08);
    [t_r10(:,i),ecg_r10(:,i)] = extract_edf(signum,data_r10,info_r10,fs_r10);
end 

% Locate the timestamp for every invasive fetal R-peak & find R-peak amplitude 
t_anno_01 = seconds(anno_r01.Onset); 
anno_01 = find_qrs(t_anno_01,t_r01(:,1),ecg_r01(:,1));
t_anno_04 = seconds(anno_r04.Onset); 
anno_04 = find_qrs(t_anno_04,t_r04(:,1),ecg_r04(:,1));
t_anno_07 = seconds(anno_r07.Onset); 
anno_07 = find_qrs(t_anno_07,t_r07(:,1),ecg_r07(:,1));
t_anno_08 = seconds(anno_r08.Onset); 
anno_08 = find_qrs(t_anno_08,t_r08(:,1),ecg_r08(:,1));
t_anno_10 = seconds(anno_r10.Onset); 
anno_10 = find_qrs(t_anno_10,t_r10(:,1),ecg_r10(:,1));

%% Filter and demean all of the data 

fl = 2;  
fh = 50; 
fs = fs_r01(1); 
N = 1024; 

for i = 1:5 
    signum = i;
    ecg_r01_filt(:,i) = bandpassfilter(ecg_r01(:,i),t_r01(:,i),fl,fh,fs,N);
    ecg_r04_filt(:,i) = bandpassfilter(ecg_r04(:,i),t_r04(:,i),fl,fh,fs,N);
    ecg_r07_filt(:,i) = bandpassfilter(ecg_r07(:,i),t_r07(:,i),fl,fh,fs,N);
    ecg_r08_filt(:,i) = bandpassfilter(ecg_r08(:,i),t_r08(:,i),fl,fh,fs,N);
    ecg_r10_filt(:,i) = bandpassfilter(ecg_r10(:,i),t_r10(:,i),fl,fh,fs,N);
    
end 

%% Chunk the ECG data and R peak annotation 

t_start = 0; 
t_end = 4; 

N = floor(t_r01(height(ecg_r01_filt),1)/4);
N_test = floor(N*0.8); 

%% Gather Training Data 
for i = 1:5
    for k=1:N*2
        signum = i;

        [t_chunk_01,ecg_chunk_01,t_chunk_Rpeak_01,ecg_chunk_Rpeak_01] = chunk_ecg(t_start,t_end,t_r01(:,i),ecg_r01_filt(:,i),t_anno_01); 
        t_01 = strcat('t',num2str(signum),'_',num2str(k));
        ecg_01 = strcat('ecg',num2str(signum),'_',num2str(k));
        r01_train.(t_01) = t_chunk_01;
        r01_train.(ecg_01) = ecg_chunk_01; 


        [t_chunk_04,ecg_chunk_04,t_chunk_Rpeak_04,ecg_chunk_Rpeak_04] = chunk_ecg(t_start,t_end,t_r04(:,i),ecg_r04_filt(:,i),t_anno_04); 
        t_04 = strcat('t',num2str(signum),'_',num2str(k));
        ecg_04 = strcat('ecg',num2str(signum),'_',num2str(k));
        r04_train.(t_04) = t_chunk_04;
        r04_train.(ecg_04) = ecg_chunk_04; 

        [t_chunk_07,ecg_chunk_07,t_chunk_Rpeak_07,ecg_chunk_Rpeak_07] = chunk_ecg(t_start,t_end,t_r07(:,i),ecg_r07_filt(:,i),t_anno_07); 
        t_07 = strcat('t',num2str(signum),'_',num2str(k));
        ecg_07 = strcat('ecg',num2str(signum),'_',num2str(k));
        r07_train.(t_07) = t_chunk_07;
        r07_train.(ecg_07) = ecg_chunk_07; 

        [t_chunk_08,ecg_chunk_08,t_chunk_Rpeak_08,ecg_chunk_Rpeak_08] = chunk_ecg(t_start,t_end,t_r08(:,i),ecg_r08_filt(:,i),t_anno_08); 
        t_08 = strcat('t',num2str(signum),'_',num2str(k));
        ecg_08 = strcat('ecg',num2str(signum),'_',num2str(k));
        r08_train.(t_08) = t_chunk_08;
        r08_train.(ecg_08) = ecg_chunk_08; 
       
        if signum == 1
  
            t_Rpeak_01 = strcat('t_Rpeak','_',num2str(k));
            Rpeak_01 = strcat('Rpeak','_',num2str(k));
            r01_train.(t_Rpeak_01) = t_chunk_Rpeak_01; 
            r01_train.(Rpeak_01) = ecg_chunk_Rpeak_01;

            t_Rpeak_04 = strcat('t_Rpeak','_',num2str(k));
            Rpeak_04 = strcat('Rpeak','_',num2str(k));
            r04_train.(t_Rpeak_04) = t_chunk_Rpeak_04; 
            r04_train.(Rpeak_04) = ecg_chunk_Rpeak_04;
            
            t_Rpeak_07 = strcat('t_Rpeak','_',num2str(k));
            Rpeak_07 = strcat('Rpeak','_',num2str(k));
            r07_train.(t_Rpeak_07) = t_chunk_Rpeak_07; 
            r07_train.(Rpeak_07) = ecg_chunk_Rpeak_07;

            t_Rpeak_08 = strcat('t_Rpeak','_',num2str(k));
            Rpeak_08 = strcat('Rpeak','_',num2str(k));
            r08_train.(t_Rpeak_08) = t_chunk_Rpeak_08; 
            r08_train.(Rpeak_08) = ecg_chunk_Rpeak_08;

         end 
        t_start = t_start+2; 
        t_end = t_end + 2;
    end 
    t_start = 0; 
    t_end = 4;
end

for k = 1:N*2
    
    var = strcat('t_Rpeak_',num2str(k));
    
    beat_01 = aveBeat_annotation(r01_train.(var)); 
    beat_name_01 = strcat('gold_',num2str(k));
    r01_train.(beat_name_01) = beat_01;

    beat_04 = aveBeat_annotation(r04_train.(var)); 
    beat_name_04 = strcat('gold_',num2str(k));
    r04_train.(beat_name_04) = beat_04;

    beat_07 = aveBeat_annotation(r07_train.(var)); 
    beat_name_07 = strcat('gold_',num2str(k));
    r07_train.(beat_name_07) = beat_07;

    beat_08 = aveBeat_annotation(r08_train.(var)); 
    beat_name_08 = strcat('gold_',num2str(k));
    r08_train.(beat_name_08) = beat_08;
        
end 
%% Gather Testing Data 
for i = 1:5
    for k=1:N*2
        signum = i;

        [t_chunk_10,ecg_chunk_10,t_chunk_Rpeak_10,ecg_chunk_Rpeak_10] = chunk_ecg(t_start,t_end,t_r10(:,i),ecg_r10_filt(:,i),t_anno_10); 
        t_10 = strcat('t',num2str(signum),'_',num2str(k));
        ecg_10 = strcat('ecg',num2str(signum),'_',num2str(k));
        r10_test.(t_10) = t_chunk_10;
        r10_test.(ecg_10) = ecg_chunk_10; 
       
        if signum == 1

            t_Rpeak_10 = strcat('t_Rpeak','_',num2str(k));
            Rpeak_10 = strcat('Rpeak','_',num2str(k));
            r10_test.(t_Rpeak_10) = t_chunk_Rpeak_10; 
            r10_test.(Rpeak_10) = ecg_chunk_Rpeak_10;

         end 
        t_start = t_start + 2; 
        t_end = t_end + 2;
    end 
    t_start = 0; 
    t_end = 4;
end

for k = 1:N*2

    beat_10 = aveBeat_annotation(r10_test.(var)); 
    beat_name_10 = strcat('gold_',num2str(k));
    r10_test.(beat_name_10) = beat_10;
        
end 

%% Save the chunked data 
save("data_chunked\r01_train","r01_train"); 
save("data_chunked\r04_train","r04_train");
save("data_chunked\r07_train","r07_train");
save("data_chunked\r08_train","r08_train");
% save("data_chunked\r10_train","r10_train");

% save("data_chunked\r01_test","r01_test"); 
% save("data_chunked\r04_test","r04_test");
% save("data_chunked\r07_test","r07_test");
% save("data_chunked\r08_test","r08_test");
save("data_chunked\r10_test","r10_test");