[pks1,locs1]=findpeaks(angle_hip2ankle(:,1),'MINPEAKHEIGHT',0.3);
[npks1,nlocs1]=findpeaks(-angle_hip2ankle(:,1),'MINPEAKHEIGHT',0.3);
[pks2,locs2]=findpeaks(angle_hip2ankle(:,2),'MINPEAKHEIGHT',0.3);
[npks2,nlocs2]=findpeaks(-angle_hip2ankle(:,2),'MINPEAKHEIGHT',0.3);

leftstanding=angle_hip2ankle(floor((nlocs1(1)+locs2(1))/2):floor((locs1(2)+nlocs2(2))/2),1);
rightstanding=angle_hip2ankle(floor((locs1(2)+nlocs2(2))/2):floor((nlocs1(2)+locs2(2))/2),2);

supporting=[];

supporting=[leftstanding'];
supporting=[supporting rightstanding'];
