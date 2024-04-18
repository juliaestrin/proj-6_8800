function [t_out,data_out,t_qrs_out,qrs_out] = chunk_ecg(t1,t2,t,data,t_qrs)

        
        index_start = find(t==t1);
        index_end = find(t==t2);
        t_out = t(index_start:index_end); 
        data_out = data(index_start:index_end); 

    
        % for i = 1:height(index)
        %    % if loc(i) ~= 0
        %         t_qrs_out(i) = t_out(index(i)); 
        %         qrs_out(i) = data_out(index(i)); 
        %   %  end 
        % end

        qrs = find_qrs(t_qrs,t,data); 
        j = 1; 

        for i = 1:length(t_qrs)
            if t_qrs(i) >=t1 && t_qrs(i) <= t2 
                t_qrs_out(j) = t_qrs(i); 
                qrs_out(j) = qrs(i); 
                j = j + 1; 
            end 
        end
end