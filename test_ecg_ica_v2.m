
N = 148;
N_test = floor(N*0.8); 

%% ICA for training data 

for k = 1:N_test
    X = [r01_train.(strcat('ecg2_',num2str(k))),r01_train.(strcat('ecg3_',num2str(k))),r01_train.(strcat('ecg4_',num2str(k)))]; 
    [ICA1, ICA2] = ecg_ica(X); 

    ICA1_name = strcat('c1_',num2str(k));
    ICA2_name = strcat('c2_',num2str(k));
    r01_train_ICA.(ICA1_name) = ICA1;
    r01_train_ICA.(ICA2_name) = ICA2;

    X = [r04_train.(strcat('ecg2_',num2str(k))),r04_train.(strcat('ecg3_',num2str(k))),r04_train.(strcat('ecg4_',num2str(k)))]; 
    [ICA1, ICA2] = ecg_ica(X); 

    ICA1_name = strcat('c1_',num2str(k));
    ICA2_name = strcat('c2_',num2str(k));
    r04_train_ICA.(ICA1_name) = ICA1;
    r04_train_ICA.(ICA2_name) = ICA2;

    X = [r07_train.(strcat('ecg2_',num2str(k))),r07_train.(strcat('ecg3_',num2str(k))),r07_train.(strcat('ecg4_',num2str(k)))]; 
    [ICA1, ICA2] = ecg_ica(X); 

    ICA1_name = strcat('c1_',num2str(k));
    ICA2_name = strcat('c2_',num2str(k));
    r07_train_ICA.(ICA1_name) = ICA1;
    r07_train_ICA.(ICA2_name) = ICA2;

    X = [r08_train.(strcat('ecg2_',num2str(k))),r08_train.(strcat('ecg3_',num2str(k))),r08_train.(strcat('ecg4_',num2str(k)))]; 
    [ICA1, ICA2] = ecg_ica(X); 

    ICA1_name = strcat('c1_',num2str(k));
    ICA2_name = strcat('c2_',num2str(k));
    r08_train_ICA.(ICA1_name) = ICA1;
    r08_train_ICA.(ICA2_name) = ICA2;

    X = [r10_train.(strcat('ecg2_',num2str(k))),r10_train.(strcat('ecg3_',num2str(k))),r10_train.(strcat('ecg4_',num2str(k)))]; 
    [ICA1, ICA2] = ecg_ica(X); 

    ICA1_name = strcat('c1_',num2str(k));
    ICA2_name = strcat('c2_',num2str(k));
    r10_train_ICA.(ICA1_name) = ICA1;
    r10_train_ICA.(ICA2_name) = ICA2;

end 

save("data_chunked_v2\r01_train_ICA","r01_train_ICA"); 
save("data_chunked_v2\r04_train_ICA","r04_train_ICA");
save("data_chunked_v2\r07_train_ICA","r07_train_ICA");
save("data_chunked_v2\r08_train_ICA","r08_train_ICA");
save("data_chunked_v2\r08_train_ICA","r10_train_ICA");

%% Perform ICA for Testing Data

for k = N_test+1:N

    X = [r01_test.(strcat('ecg2_',num2str(k))),r01_test.(strcat('ecg3_',num2str(k))),r01_test.(strcat('ecg4_',num2str(k)))]; 
    [ICA1, ICA2] = ecg_ica(X); 

    ICA1_name = strcat('c1_',num2str(k));
    ICA2_name = strcat('c2_',num2str(k));
    r01_test_ICA.(ICA1_name) = ICA1;
    r01_test_ICA.(ICA2_name) = ICA2;

    X = [r04_test.(strcat('ecg2_',num2str(k))),r04_test.(strcat('ecg3_',num2str(k))),r04_test.(strcat('ecg4_',num2str(k)))]; 
    [ICA1, ICA2] = ecg_ica(X); 

    ICA1_name = strcat('c1_',num2str(k));
    ICA2_name = strcat('c2_',num2str(k));
    r04_test_ICA.(ICA1_name) = ICA1;
    r04_test_ICA.(ICA2_name) = ICA2;

    X = [r07_test.(strcat('ecg2_',num2str(k))),r07_test.(strcat('ecg3_',num2str(k))),r07_test.(strcat('ecg4_',num2str(k)))]; 
    [ICA1, ICA2] = ecg_ica(X); 

    ICA1_name = strcat('c1_',num2str(k));
    ICA2_name = strcat('c2_',num2str(k));
    r07_test_ICA.(ICA1_name) = ICA1;
    r07_test_ICA.(ICA2_name) = ICA2;

    X = [r08_test.(strcat('ecg2_',num2str(k))),r08_test.(strcat('ecg3_',num2str(k))),r08_test.(strcat('ecg4_',num2str(k)))]; 
    [ICA1, ICA2] = ecg_ica(X); 

    ICA1_name = strcat('c1_',num2str(k));
    ICA2_name = strcat('c2_',num2str(k));
    r08_test_ICA.(ICA1_name) = ICA1;
    r08_test_ICA.(ICA2_name) = ICA2;

    X = [r10_test.(strcat('ecg2_',num2str(k))),r10_test.(strcat('ecg3_',num2str(k))),r10_test.(strcat('ecg4_',num2str(k)))]; 
    [ICA1, ICA2] = ecg_ica(X); 

    ICA1_name = strcat('c1_',num2str(k));
    ICA2_name = strcat('c2_',num2str(k));
    r10_test_ICA.(ICA1_name) = ICA1;
    r10_test_ICA.(ICA2_name) = ICA2;

end 

save("data_chunked_v2\r01_test_ICA","r01_test_ICA");
save("data_chunked_v2\r04_test_ICA","r04_test_ICA");
save("data_chunked_v2\r07_test_ICA","r07_test_ICA");
save("data_chunked_v2\r08_test_ICA","r08_test_ICA");
save("data_chunked_v2\r10_test_ICA","r10_test_ICA");
