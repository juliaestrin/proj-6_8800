function [beat_length] = aveBeat_annotation(t_Rpeaks)
    
    N = length(t_Rpeaks);
    if N ~= 0 
        t = t_Rpeaks(end)-t_Rpeaks(1); 
        beat_length = t/(N-1); 
    else 
        beat_length = NaN; 
    end 
end