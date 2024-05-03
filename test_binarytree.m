
for i = 1:length(feature_vec_test) 
    if isnan(feature_vec_train(3,i)) == 1
        feature_vec_train(3,i) = 4; 
    end 
end 

for i = length(gold_vec_train):-1:1
    if isnan(gold_vec_train(i)) == 1
        gold_vec_train(i) = []; 
        feature_vec_train(:,i) = []; 
    end 
end 