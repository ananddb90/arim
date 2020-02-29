function [S,Frepr,trepr] = stft(x,Nfft,w,Nstep,Fs)
    N = length(x);
    M = length(w);
    Nstep = floor(Nstep);
    
    Nmax = ceil(N/Nstep);
    
    S = zeros(Nfft,Nmax);       
    w = w/sum(w);
    x1 = [zeros(1,M) x zeros(1,M)];
    
    for ii = 1:Nmax
        w_pad = zeros(1,N+2*M);
        w_pad((ii-1)*Nstep+1+M/2:(ii-1)*Nstep + M + M/2) = w;                
        s = x1.*w_pad; s = s(M+1:end);
        S(:,ii) = fft(s,Nfft).';
    end;  
    trepr = (M/2 + (0:Nmax-1)*Nstep)/Fs;
    Frepr = (0:1/Nfft:1-1/Nfft)*Fs;