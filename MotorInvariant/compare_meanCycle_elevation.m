figure;
axis([-0.5 0.4 -0.02 0.03])


clearvars -except ankle
load 'data/motion_basic.mat'
Cmean_ankle=mean(FinalCycleArray_ankle,2);
Cmean_knee=mean(FinalCycleArray_knee,2);
hold on;	
if(ankle==true)	
	plot(-Cmean_ankle(10:end-10),gradient(-Cmean_ankle(10:end-10)),'r','LineWidth',3);
else
	plot(-Cmean_knee(10:end-10),gradient(-Cmean_knee(10:end-10)),'r','LineWidth',3);		
end


clearvars -except ankle
load 'data/motion_elevation2.mat'
Cmean_ankle=mean(FinalCycleArray_ankle,2);
Cmean_knee=mean(FinalCycleArray_knee,2);
hold on;	
if(ankle==true)	
	plot(-Cmean_ankle(10:end-10),gradient(-Cmean_ankle(10:end-10)),'g','LineWidth',3);
else
	plot(-Cmean_knee(10:end-10),gradient(-Cmean_knee(10:end-10)),'g','LineWidth',3);		
end


clearvars -except ankle
load 'data/motion_elevation5.mat'
Cmean_ankle=mean(FinalCycleArray_ankle,2);
Cmean_knee=mean(FinalCycleArray_knee,2);
hold on;	
if(ankle==true)	
	plot(-Cmean_ankle(10:end-10),gradient(-Cmean_ankle(10:end-10)),'b','LineWidth',3);
else
	plot(-Cmean_knee(10:end-10),gradient(-Cmean_knee(10:end-10)),'b','LineWidth',3);		
end

