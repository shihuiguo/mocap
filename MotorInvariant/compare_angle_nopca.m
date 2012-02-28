ankle=false;


figure;

clearvars -except ankle
load 'data/basic.mat'
hold on;
if(ankle==true)
	plot(angle_hip2ankle(500:1000),gradient(angle_hip2ankle(500:1000)),'r');
else
	plot(angle_hip2knee(500:1000),gradient(angle_hip2knee(500:1000)),'r');	
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
hold on;
if(ankle==true)
	plot(angle_hip2ankle(500:1000),gradient(angle_hip2ankle(500:1000)),'g');
else
	plot(angle_hip2knee(500:1000),gradient(angle_hip2knee(500:1000)),'g');	
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
hold on;
if(ankle==true)
	plot(angle_hip2ankle(500:1000),gradient(angle_hip2ankle(500:1000)),'b');
else
	plot(angle_hip2knee(500:1000),gradient(angle_hip2knee(500:1000)),'b');	
end
