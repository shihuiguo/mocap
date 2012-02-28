ankle=false;
figure;

clearvars -except ankle
load 'data/basic.mat'
hold on;
plot(angle_hip2ankle(500:700),'r');

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
hold on;
plot(angle_hip2ankle(500:700),'g');
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
hold on;
plot(angle_hip2ankle(500:700),'b');
