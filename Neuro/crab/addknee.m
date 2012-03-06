

chout=c(locs1(2):locs1(2)+1500,:);

[pks1,locs1]=findpeaks(chout(:,19));
[pks2,locs2]=findpeaks(chout(:,10));

knee=-abs(Y(:,1))/pi*180*x;
[kneepks,kneelocs]=findpeaks(knee);

chout(:,22)=knee(kneelocs(2):kneelocs(2)+1500,:)-60;
chout(:,40)=knee(kneelocs(2):kneelocs(2)+1500,:)-60;

knee2=-abs(Y_out(:,1))/pi*180*x;
[knee2pks,knee2locs]=findpeaks(knee2);
chout(:,13)=knee2(knee2locs(2):knee2locs(2)+1500,:)-60;
chout(:,31)=knee2(knee2locs(2):knee2locs(2)+1500,:)-60;

%[pks1,locs1]=findpeaks(chout(:,19));
numCycle=length(locs1)-1;

for i=1:numCycle

	xyz=bvh2xyz(s,chout(locs1(i),:));
	footxyz=xyz(9,:);

	for j=locs1(i)+1:(locs2(i))
		rootxyz=rootPos(s,chout(j,:),9,footxyz);
		chout(j,1)=rootxyz(1);
		chout(j,2)=rootxyz(2);
		chout(j,3)=rootxyz(3);
	end


	xyz=bvh2xyz(s,chout(locs2(i),:));
	footxyz=xyz(13,:);

	for j=locs2(i)+1:locs1(i+1)
		rootxyz=rootPos(s,chout(j,:),13,footxyz);
		chout(j,1)=rootxyz(1);
		chout(j,2)=rootxyz(2);
		chout(j,3)=rootxyz(3);

	end

end

