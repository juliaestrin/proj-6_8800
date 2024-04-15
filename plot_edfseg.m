function [t,y] = plot_edfseg(recnum,signum,data,info,fs)
    t = (0:info.NumSamples(signum)-1)/fs(signum);
    y = data.(signum){recnum};
end