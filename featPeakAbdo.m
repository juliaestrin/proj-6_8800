function [m_num_peaks,f_num_peaks, m_avg_spacing,f_avg_spacing, m_avg_peak_mag,f_avg_peak_mag] = featPeakAbdo(chunk,fs) 
%Find peaks for the mixed signal
%Start with the normalised amplitude
%Set min distance between peaks (spcTh) and threshold magnitude magTh
%pn is mode to find peaks,
%default mode is finding only positive peaks (R waves only) 
%mode 1 = finding both of positive and negative peaks (R and S wave) 

%default settings
% if nargin < 5
%     magTh = 0.15;
% end
% if nargin < 4
%     spcTh = 150;
% end
% if nargin < 3
%     pn = 0;
% end
% 
if nargin < 2
    fs = 1000;
    %time = index / fs
end

if contains(channel, 'ecg1')
    magTh = 0.05;
else
magTh = 0.09;
end
magTh = 0.05;
spcTh = 120;
magThH = 0.2;
spcThH = 400;
pn = 1;
fs = 1000;
magThS = 0.23;
spcThS = 200;



% chunk = chunk_r04_1_filtered;

normChunk = normal(chunk);

dNormChunk = detrend(normChunk);
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
[Rpks,locs_Rwave] = findpeaks(dNormChunk,'MinPeakHeight',magTh,'MinPeakDistance',spcTh);
[RpksM,locs_RwaveM] = findpeaks(dNormChunk,'MinPeakHeight',magThH,'MinPeakDistance',spcThH);
invChunk = -dNormChunk;
[Spks, locs_Swave] = findpeaks(invChunk,'MinPeakHeight',magThS,'MinPeakDistance',spcThS);

%Swave = m peaks and Rwave-Swave = f peaks
range = 50;
fKeep = true(size(locs_Rwave));
% Initialize a logical array to keep track of elements to keep
to_keep = true(size(locs_Rwave));

% Iterate over each element in locs_Rwave
for i = 1:numel(locs_Rwave)
    % Check if locs_Rwave(i) is within range of any element in locs_Swave
   if any(abs(locs_Rwave(i) - locs_Swave) <= range) || any(abs(locs_Rwave(i) - locs_RwaveM) <= range)
        % If it is within range, mark it for deletion
        to_keep(i) = false;
    end
end

% Delete the elements from locs_Rwave that are within range of locs_Swave
locs_F = locs_Rwave(to_keep);


% UNCOMMENT FIGURE TO SEE PEAKS
figure()
subplot(3,1,1)
plot(normChunk)
hold on
plot(locs_Rwave,dNormChunk(locs_Rwave),'rs','MarkerFaceColor','b');
subplot(3,1,2)
plot(normChunk);
hold on
plot(locs_Swave,dNormChunk(locs_Swave),'rv','MarkerFaceColor','r');
hold on
plot(locs_RwaveM,dNormChunk(locs_RwaveM),'bs','MarkerFaceColor','r');
subplot(3,1,3)
plot(normChunk);
hold on
plot(locs_F,dNormChunk(locs_F),'rv','MarkerFaceColor','g');
hold on
scatter(t_qrs_r01_5*fs,0.01*qrs_r01_5);
hold on
plot(locs_Swave,dNormChunk(locs_Swave),'rv','MarkerFaceColor','r');


%take the location of peaks whichever has more peaks as maternal peaks from negative peaks or higher peaks 
        locs_M = locs_RwaveM;

%[m_num_peaks,f_num_peaks, m_avg_spacing,f_avg_spacing, m_avg_peak_mag,f_avg_peak_mag]
diffMpks = diff(locs_M);
diffFpks = diff(locs_F);

m_num_peaks = length(locs_M);
m_avg_spacing = mean(diffMpks)/fs;
m_avg_peak_mag = mean(chunk(locs_M));

f_num_peaks = length(locs_F);
f_avg_spacing = mean(diffFpks)/fs;
f_avg_peak_mag = mean(chunk(locs_F));

