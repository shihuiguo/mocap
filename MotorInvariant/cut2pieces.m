% This file selects the range inside the clip, and cuts it into pieces, each is a walking cycle
% The rule to cut the signal is based on the position of 
% 4 is LeftAnkle, 8 is RightAnkle


start_frame=300;
end_frame=1200;


ankle_motion=angle_hip2ankle(start_frame:end_frame);

knee_motion=angle_hip2knee(start_frame:end_frame);	

ankle_motion=filter(ones(1,5)/5,1,ankle_motion);

knee_motion=filter(ones(1,5)/5,1,knee_motion);

cutting_motion=angle_hip2ankle(start_frame:end_frame);

% This is important, if you select the left foot to cut the data, then you should calculate the angle between hip and ankle/knee on the left side
% Currently, Hip2Ankle, and Hip2Knee both calculates the angle on the left side
[pks,locs]=findpeaks(cutting_motion,'MINPEAKDISTANCE',15);

index=find(locs<10);
locs(index)=[];

index=find(locs>((end_frame-start_frame)-10));
locs(index)=[];           

A_ankle=[];
A_knee=[];
numCycle=size(locs,2)-1;

for i=1:numCycle

	nextCycle_ankle=ankle_motion((locs(i)-5):(locs(i+1)+5));
	nextCycle_knee=knee_motion((locs(i)-5):(locs(i+1)+5));
	bvhPlayData(s,c((start_frame+locs(i)):(start_frame+locs(i+1)),:),0.04);
	strResponse=input('Do you want to delete this cycle? y/n','s');
	if(strResponse=='y')
		continue;
	end
	nextCycle_ankle=resample(nextCycle_ankle,30,size(nextCycle_ankle,1));
	nextCycle_knee=resample(nextCycle_knee,30,size(nextCycle_knee,1));
	A_ankle=[A_ankle nextCycle_ankle];		
	A_knee=[A_knee nextCycle_knee];		
end

interp_step=0.2;

vsize=size(A_ankle);

for i=1:vsize(2)
	FinalCycleArray_ankle(:,i)=interp1(1:vsize(1),A_ankle(:,i),1:interp_step:vsize(1),'spline');
	FinalCycleArray_knee(:,i)=interp1(1:vsize(1),A_knee(:,i),1:interp_step:vsize(1),'spline');
end
