function [feature_vec,gold_vec] = removeNans(feature_vec,gold_vec)

for i = length(gold_vec):-1:1
    if isnan(feature_vec(3,i)) == 1
        i
        gold_vec(i) = []; 
        feature_vec(:,i) = [];  
    end 
end 

for i = length(gold_vec):-1:1
    if isnan(gold_vec(i)) == 1
        i
        gold_vec(i) = []; 
        feature_vec(:,i) = []; 
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
