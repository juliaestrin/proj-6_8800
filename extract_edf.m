function [t,y] = extract_edf(signum,data,info,fs)
    
    t = 0; 
    y = 0; 
    t_last = 0;
    for i = 1:height(data)
        t_temp = (0:info.NumSamples(signum)-1)/fs(signum)+t_last;
        t_temp = t_temp(:); 
        t = vertcat(t,t_temp);
        t_last = t(end); 
    
        y_temp = data.(signum){i};
        y = vertcat(y,y_temp); 
    end 
end