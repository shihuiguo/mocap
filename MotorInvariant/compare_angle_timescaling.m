% This file compares the Hip2ankle/Hip2knee angles between different elevations

%2=2;

figure;
axis([-0.5 0.4 -0.02 0.03])
clearvars -except ankle
load 'data/motion_basic.mat'
%cut2pieces;
%pca_analysis;
for i=1:size(FinalCycleArray_knee,2)
	hold on;	
	if(ankle==true)	
		plot(-FinalCycleArray_ankle(10:end-10,i),gradient(-FinalCycleArray_ankle(10:end-10,i)),'r','LineWidth',2);
	else
		plot(-FinalCycleArray_knee(10:end-10,i),gradient(-FinalCycleArray_knee(10:end-10,i)),'r','LineWidth',2);		
	end
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
load 'data/motion_timescale3.mat'
%cut2pieces;
%pca_analysis;
for i=1:size(FinalCycleArray_knee,2)
	hold on;	
	if(ankle==true)	
		plot(-FinalCycleArray_ankle(10:end-10,i),gradient(-FinalCycleArray_ankle(10:end-10,i)),'g','LineWidth',2);
	else
		plot(-FinalCycleArray_knee(10:end-10,i),gradient(-FinalCycleArray_knee(10:end-10,i)),'g','LineWidth',2);		
	end
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
load 'data/motion_timescale5.mat'
%cut2pieces;
%pca_analysis;
for i=1:size(FinalCycleArray_knee,2)
	hold on;	
	if(ankle==true)	
		plot(-FinalCycleArray_ankle(10:end-10,i),gradient(-FinalCycleArray_ankle(10:end-10,i)),'b','LineWidth',2);
	else
		plot(-FinalCycleArray_knee(10:end-10,i),gradient(-FinalCycleArray_knee(10:end-10,i)),'b','LineWidth',2);		
	end
end

