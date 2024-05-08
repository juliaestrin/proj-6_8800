function [acc] = accuracy(true, predicted, threshold)

N = length(true);

hits = zeros(N,1);

for i = 1:length(true)
    true_i = true(i);
    predicted_i = predicted(i);
    if (true_i == predicted_i) || ((true_i - threshold <= predicted_i) && (predicted_i <= (true_i + threshold)))
         hits(i) = 1;
    end
end

    summed = sum(hits);
    acc = summed/N; 
end 