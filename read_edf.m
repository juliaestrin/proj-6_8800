function [data,annotation,info,fs] = read_edf(edf)
    [data,annotation] = edfread(edf); 
    info = edfinfo(edf);
    fs = info.NumSamples/seconds(info.DataRecordDuration); 
end