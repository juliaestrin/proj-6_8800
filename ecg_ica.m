function [IC1, IC2] = ecg_ica(X)
% Each row of X represents an observed signal from a seperate lead
% X should have data from only 3 leads
% The function computes the ICs and removes the noise IC by calculating
% kurtosis. It returns the maternal and fetal IC.

[a, b] = size(X);
if a < b
    error('Please transpose input.');
end

if b ~= 3
    error('Only input 3 leads.');
end

Nsources = 3;

X_whitened = prewhiten(X);
Mdl = rica(X_whitened,Nsources);
unmixed = transform(Mdl,X_whitened);

kurt = kurtosis(unmixed);
[~,idx] = sort(kurt, 'descend');
unmixed_sorted = unmixed(:,idx);

IC1 = unmixed_sorted(:,1);
IC2 = unmixed_sorted(:,2);
% IC3 = unmixed_sorted(:,3);