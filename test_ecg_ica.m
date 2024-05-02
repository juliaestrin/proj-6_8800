
X = [r01.ecg1_3,r01.ecg1_4,r01.ecg1_5]; 

[IC1, IC2] = ecg_ica(X); 

figure 
tiledlayout(2,1)
nexttile 
plot(IC1)
hold on 
nexttile
plot(IC2)