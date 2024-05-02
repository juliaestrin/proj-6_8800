function [t_out,data_out,t_qrs_out,qrs_out] = chunk_ecg(t1,t2,t,data,t_qrs)
        
        t_out = []; 
        data_out = []; 
        t_qrs_out = []; 
        qrs_out = []; 


        
        [tf1,loc1] = ismembertol(t,t1,1e-6);
        tf1 = find(tf1);
        [~,idx1] = unique(loc1(tf1), 'first');
        index1 = tf1(idx1);

        [tf2,loc2] = ismembertol(t,t2,1e-6);
        tf2 = find(tf2);
        [~,idx2] = unique(loc2(tf2), 'first');
        index2 = tf2(idx2);

        t_out = t(index1:index2); 
        data_out = data(index1:index2); 

        [tf,loc] = ismembertol(t_out,t_qrs,1e-6);
        tf = find(tf);
        [~,idx] = unique(loc(tf), 'first');
        index = tf(idx);
        
        for i = 1:height(index)
           %if loc(i) ~= 0
                t_qrs_out(i) = t_out(index(i)); 
                qrs_out(i) = data_out(index(i)); 
         %  end 
        end
end