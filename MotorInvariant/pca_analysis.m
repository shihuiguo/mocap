meanA=mean(A')';
Data=A-repmat(mean(A')',1,numCycle);
[U S V]=svd(Data,0);
Scopy=S;
vsize=min(size(S));
for i=2:vsize
	Scopy(i,i)=0;
end

Recon=U*Scopy*V';
Recon=Recon+repmat(mean(A')',1,numCycle);

