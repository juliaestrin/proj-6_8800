function [qrs] = find_qrs(t_qrs,t,data)
    
    for i=1:length(t_qrs)
        if any(abs(t_qrs(i)-t) < 1E-15)
            display(i)
        end
    end

    for i = 1:height(index)
        qrs(i) = data(index(i)); 
    end
end