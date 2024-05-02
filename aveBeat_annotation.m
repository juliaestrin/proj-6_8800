function [beat_length] = aveBeat_annotation(t_Rpeaks)
    
    N = length(t_Rpeaks); 
    t = t_Rpeaks(end)-t_Rpeaks(1); 
    beat_length = t/(N-1); 

end