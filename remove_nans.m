function [feature_vec,gold_vec] = removeNans(feature_vec,gold_vec)

for i = 1:length(feature_vec) 
    if isnan(feature_vec_train(3,i)) == 1
        gold_vec_train(i) = []; 
        feature_vec_train(:,i) = [];  
    end 
end 

for i = length(gold_vec_train):-1:1
    if isnan(gold_vec_train(i)) == 1
      
        gold_vec_train(i) = []; 
        feature_vec_train(:,i) = []; 
    end 
end 

% %% Transpose the data 
% 
% X = transpose(feature_vec_train); 
% Y = transpose(gold_vec_train); 
% 
% MdlDefault = fitctree(X,Y); 
% 
% test = transpose(gold_vec_test); 
% Output = predict(MdlDefault,test); 