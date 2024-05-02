function [normX] = normal(data,mode)
%default mode = use max, min to normalise
%mode 1 = use second max, second min to normalise

if nargin < 2
    mode = 0;
end

% Find the max and min values
max_val = max(data);
min_val = min(data);
max_min = abs(max_val - min_val);

% Remove the max and min values from the data
data_without_max = data(data < max_val);
data_without_min = data(data > min_val);

% Find the second largest max value and second smallest min value
second_max_val = max(data_without_max);
second_min_val = min(data_without_min);
second_max_min = abs(second_max_val - second_min_val);

if mode == 0
normX = data/max_min;
else
% Normalize the data using the second largest max and second smallest min
normX = data/second_max_min;
end

