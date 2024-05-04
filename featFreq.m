function [MagMax,fundFreq] = featFreq(chunk,fs)

% chunk = ICA1;
% fs = 1000;

if nargin < 2
    fs = 1000;
end

[pxxChunk,fChunk] = pwelch(chunk,[],[],[],fs);

[peakPSD, peakLocPSD] = findpeaks(pxxChunk);

[MagMax, IndexMax] = max(peakPSD);

% max magnitude = max peak
fundFreq = fChunk(peakLocPSD(IndexMax));

% second harmonic = 2* fundamental frequency => might not be accurate. might not exist.. should we? 

