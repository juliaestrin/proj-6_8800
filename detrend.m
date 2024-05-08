function Y = detrend(data)

[p,s,mu] = polyfit((1:numel(data))',data,6);
f_y = polyval(p,(1:numel(data))',[],mu);

Y = data - f_y;        % Detrend data