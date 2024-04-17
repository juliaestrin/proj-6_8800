function [sf,tt] = bandpassfilter(xn,tn,fl,fh,Fs,N)

    F_Nyq = Fs/2;
    W1 = fl/F_Nyq; 
    W2 = fh/F_Nyq;  
    
    Wn = [W1 W2]; 
    ftype = "bandpass";
    d = fir1(N, Wn, ftype);
    xf = filter(d,1,xn); 

    delay = mean(grpdelay(d)); 
    sf = xf; 
    sf(1:delay) = [];
    tt = tn(1:end-delay);

end