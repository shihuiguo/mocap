figure;

clearvars -except ankle
load 'data/basic.mat'
stepsize=motionxyz(500:700,4,3)-motionxyz(500:700,8,3);
[pks,locs]=findpeaks(stepsize,'MINPEAKDISTANCE',10);
hold on;
plot(pks,'r');

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
stepsize=motionxyz(500:700,4,3)-motionxyz(500:700,8,3);
[pks,locs]=findpeaks(stepsize,'MINPEAKDISTANCE',10);
hold on;
plot(pks,'g');
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
stepsize=motionxyz(500:700,4,3)-motionxyz(500:700,8,3);
[pks,locs]=findpeaks(stepsize,'MINPEAKDISTANCE',10);
hold on;
plot(pks,'b');

