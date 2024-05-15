function [meanFt,stdFt,skewFt,kurFt,rmsFt,medFt,entFt] = featStat(chunk)

% chunk = ICA1;
% fs = 1000;


meanFt = mean(chunk,"all");
stdFt = std(chunk);
skewFt = skewness(chunk);
kurFt = kurtosis(chunk);
rmsFt = rms(chunk);
medFt = median(chunk);
entFt = computeEntropy(chunk);

