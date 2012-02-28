ankle=false;

clearvars -except ankle
load 'data/basic.mat'
cut2pieces;
meanA=mean(A')';
for i=1:numCycle
	hold on;	
	plot(Recon(5:35,i),gradient(Recon(5:35,i)),'r');
end

%{
clearvars -except ankle
load 'data/elevation2.mat'
cut2pieces;
pca_analysis;
for i=1:numCycle
	hold on;	
	plot(Recon(5:35,i),gradient(Recon(5:35,i)),'r');
end
%}

clearvars -except ankle
load 'data/elevation3.mat'
cut2pieces;
pca_analysis;
for i=1:numCycle
	hold on;	
	plot(Recon(5:35,i),gradient(Recon(5:35,i)),'g');
end

%{
clearvars -except ankle
load 'data/elevation4.mat'
cut2pieces;
pca_analysis;
for i=1:numCycle
	hold on;	
	plot(Recon(5:35,i),gradient(Recon(5:35,i)),'b');
end
%}

clearvars -except ankle
load 'data/elevation5.mat'
cut2pieces;
pca_analysis;
for i=1:numCycle
	hold on;	
	plot(Recon(5:35,i),gradient(Recon(5:35,i)),'b');
end

