function [sig_filtered] = old_bandpassfilter(sig,fl,fh,Fs,N)

    F_Nyq = Fs/2;
    W1 = fl/F_Nyq; 
    W2 = fh/F_Nyq;  
    
    Wn = [W1 W2]; 
    ftype = "bandpass";
    B= fir1(N, Wn, ftype);
    sig_filtered = filter(B,1,sig); 

end