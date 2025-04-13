clear; 
nruns=10;
nsize=20;
n=round(logspace(1,3.7,nsize));
t=zeros(nsize,1);
for j=1:nsize
    tic;
    for k = 1:nruns
        U=tril(rand(n(j)));
        b=rand(n(j),1);
        x=forsub(U,b);
    end
    % Average
    t(j)=toc/nruns;
end
loglog(n,t,'o');hold on;
loglog(n,n.^2/1e7);xlabel('matrix size');ylabel('cpu time (s)');hold off;