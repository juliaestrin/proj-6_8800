function [qrs] = find_qrs(t_qrs,t,data)
       % t_qrs = float(t_qrs); 
        %t = float(t); 
        [tf,loc] = ismembertol(t,t_qrs,1e-6);
        tf = find(tf);
        [~,idx] = unique(loc(tf), 'first');
        index = tf(idx);

    for i = 1:height(index)
        qrs(i) = data(index(i)); 
    end
end