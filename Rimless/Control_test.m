BVH2XYZ4ALLJOINTS_Rimless;
Hip2Ankle_Rimless;

load data.mat

c_test=[];

[pks1,locs1]=findpeaks(angle_hip2ankle(:,1),'MINPEAKHEIGHT',0.3);
[npks1,nlocs1]=findpeaks(-angle_hip2ankle(:,1),'MINPEAKHEIGHT',0.3);
[pks2,locs2]=findpeaks(angle_hip2ankle(:,2),'MINPEAKHEIGHT',0.3);
[npks2,nlocs2]=findpeaks(-angle_hip2ankle(:,2),'MINPEAKHEIGHT',0.3);

leftstanding_start=floor((nlocs1(1)+locs2(1))/2);
leftstanding_end=floor((locs1(2)+nlocs2(2))/2);
rightstanding_start=floor((locs1(2)+nlocs2(2))/2);
rightstanding_end=floor((nlocs1(2)+locs2(2))/2);

leftstanding=angle_hip2ankle(floor((nlocs1(1)+locs2(1))/2):floor((locs1(2)+nlocs2(2))/2),1);
rightstanding=angle_hip2ankle(floor((locs1(2)+nlocs2(2))/2):floor((nlocs1(2)+locs2(2))/2),2);

con=yout(:,1);
[conpks,conlocs]=findpeaks(abs(diff(con)),'MINPEAKHEIGHT',0.3);
num_clips=length(conlocs);

for i=1:num_clips
	clip=con(conlocs(i):conlocs(i+1));
%	clip=resample(clip,size(c,1),length(clip));
	
	c_test=[];	

	for j=1:length(clip)
		if mod(i,2)==0
			compare_con=clip(j)-leftstanding;
			[com_min,min_locs]=min(abs(compare_con));
		else
			compare_con=clip(j)-rightstanding;
			[com_min,min_locs]=min(abs(compare_con));
		end
		c_test=[c_test; c(min_locs,:)];
	end
	bvhPlayData(s,c_test,f/4);
	pause(3.0);
end
