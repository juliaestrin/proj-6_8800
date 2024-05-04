function entropy = computeEntropy(chunk)
    % Compute the probability distribution of the signal
    [uniqueSymbols, ~, index] = unique(chunk);
    probabilities = histcounts(index, 1:numel(uniqueSymbols)+1) / numel(chunk);
    
    % Compute entropy
    entropy = -sum(probabilities .* log2(probabilities), 'omitnan');
end
