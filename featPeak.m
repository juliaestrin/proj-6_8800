function [num_peaks, avg_spacing, avg_peak_mag] = featPeak(chunk,fs,pn,spcTh,magTh) 
%Find peaks
%Start with the normalised amplitude
%Set min distance between peaks (spcTh) and threshold magnitude magTh
%pn is mode to find peaks,
%default mode is finding only positive peaks (R waves only) 
%mode 1 = finding both of positive and negative peaks (R and S wave) 

%default settings
if nargin < 5
    magTh = 0.15;
end
if nargin < 4
    spcTh = 150;
end
if nargin < 3
    pn = 0;
end
if nargin < 2
    fs = 1000;
    %time = index / fs
end


%chunk = comp_4;
normChunk = normal(chunk);
% dNormChunk = detrend(normChunk);
% 
% figure()
% subplot(3,1,1)
% plot(chunk);
% subplot(3,1,2)
% plot(normChunk);
% subplot(3,1,3)
% plot(dNormChunk);
%% 

% abChunk = abs(chunk);
% normAbChunk = normal(abChunk);
%smoothChunk = fir1(chunk);

%% 
% 
% figure()
% subplot(4,1,1)
% plot(chunk);
% subplot(4,1,2)
% plot(normChunk);
% subplot(4,1,3)
% plot(abChunk);
% subplot(4,1,4)
% plot(normAbChunk);
% hold on;
% scatter(t_qrs_r01_1,0*qrs_r01_1); 


%% find peaks
[Rpks,locs_Rwave] = findpeaks(normChunk,'MinPeakHeight',magTh,'MinPeakDistance',spcTh);
invChunk = -normChunk;
[Spks, locs_Swave] = findpeaks(invChunk,'MinPeakHeight',magTh,'MinPeakDistance',spcTh);

% UNCOMMENT FIGURE TO SEE PEAKS
% figure()
% subplot(2,1,1)
% plot(chunk)
% subplot(2,1,2)
% plot(normChunk);
% hold on
% plot(locs_Swave,normChunk(locs_Swave),'rv','MarkerFaceColor','r');
% hold on
% plot(locs_Rwave,normChunk(locs_Rwave),'rs','MarkerFaceColor','b');

% magTh = 0.15;
% spcTh = 150;
% pn = 1;
% fs = 1000;

locs_all = sort([locs_Rwave; locs_Swave]);
    diffRpks = diff(locs_Rwave);
    diffAll = diff(locs_all);

if pn == 0
    num_peaks = length(Rpks);
    avg_spacing = mean(diffRpks)/fs;
    avg_peak_mag = mean(chunk(locs_Rwave));
else
    num_peaks = length(Rpks)+length(Spks);
    avg_spacing = mean(diffAll)/fs;
    %in this case, use absolute values for each peak.
    avg_peak_mag = mean(abs(chunk(locs_all)));
end

