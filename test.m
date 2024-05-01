X = [18 3 1 11; 8 10 11 3; 9 14 6 1; 4 3 15 21; 2 7 8 9];
c = zeros(1,length(X));
for i = 1:length(X)
    maxValue = max(X(i,:));
    c(i) = find(X(i,:) == maxValue);
end
