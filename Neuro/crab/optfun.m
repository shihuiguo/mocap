function f=optfun(x)

global skel channels Yopt unit;

% the objective function to minimize the head motion with respect to the amplitude of the knee

numFrames=size(channels,1);

[kneepks,kneelocs]=findpeaks(-abs(Yopt(:,1)));

unit=Yopt(kneelocs(3):kneelocs(4),1);

minLen=min(numFrames,length(unit));

if minLen == length(unit)
	channels(1:minLen,22)=unit/pi*180*x-60;
else
	channels(:,22)=unit(1:minLen)/pi*180*x-60;
end

% channels(:,40) = channels(:,22);
% channels(:,49) = -channels(:,22);
% channels(:,67) = -channels(:,22);

% channels(:,13) = channels(:,22);
% channels(:,31) = channels(:,22);
% channels(:,58) = -channels(:,22);
% channels(:,76) = -channels(:,22);

% only pass in the interval of standing for joint 9 [ locs1(i):locs2(i) ]
xyz=bvh2xyz(skel,channels(1,:));
footxyz=xyz(9,:);

for i=1:numFrames
	rootxyz=rootPos(skel,channels(i,:),9,footxyz);
	channels(i,1)=rootxyz(1);
	channels(i,2)=rootxyz(2);
	channels(i,3)=rootxyz(3);
end

f=sum((diff(channels(:,2))).^2+(diff(channels(:,1)).^2));
