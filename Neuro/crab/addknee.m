
%{
chout=c(locs1(2):locs1(2)+1500,:);

%[pks1,locs1]=findpeaks(chout(:,19));
%[pks2,locs2]=findpeaks(chout(:,10));

knee=-abs(Y(:,1))/pi*180*x;
[kneepks,kneelocs]=findpeaks(knee);

chout(:,22)=knee(kneelocs(2):kneelocs(2)+1500,:)-60;
chout(:,40)=knee(kneelocs(2):kneelocs(2)+1500,:)-60;

knee2=-abs(Y_out(:,1))/pi*180*x;
[knee2pks,knee2locs]=findpeaks(knee2);
chout(:,13)=knee2(knee2locs(2):knee2locs(2)+1500,:)-60;
chout(:,31)=knee2(knee2locs(2):knee2locs(2)+1500,:)-60;

%%%%%%%% add the hind legs %%%%%%%%%%%%
chout(:,49)=-knee(kneelocs(2):kneelocs(2)+1500,:)+60;
chout(:,67)=-knee(kneelocs(2):kneelocs(2)+1500,:)+60;

chout(:,58)=-knee2(kneelocs(2):kneelocs(2)+1500,:)+60;
chout(:,76)=-knee2(kneelocs(2):kneelocs(2)+1500,:)+60;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

[pks1,locs1]=findpeaks(chout(:,19));
[pks2,locs2]=findpeaks(chout(:,10));
numCycle=length(locs1)-1;

if(locs1(1)>locs2(1))
	locs1=[1 locs1];
end
%}

% Begins from the peak
% chout = c(locs1(2):locs1(2)+1500,:);

% chout(2:end,:) = 0;
% store the derivative for each channel

clear all;




ControlParam_crab;       % Load control parameters

[s,c,f]=bvhReadFile('guo/Neuro/crab/test6.bvh');

chout = zeros(1500, 78);
d_ch = zeros(size(chout));

% initialize the derivative for the first channel
[chout(1,:), d_ch(1, :)] = firstFrame() ;

initvalue = bvh2xyz(s, chout(1,:));

initfooty = initvalue(13, 2);

% left equals true, which means the left leg groups are standing, index 9
left = false;
footxyz = initvalue(13, :);



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Before calculating, you should figure out the amplitude of the knee
% use the script in kneeAmp.m
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

sign = [];

for j=1:size(chout,1)

	sign = [sign left];

	if left == true
		rootxyz=rootPos(s,chout(j,:),9,footxyz);
		chout(j,1)=rootxyz(1);
		chout(j,2)=rootxyz(2);
		chout(j,3)=rootxyz(3);
		
		
		

		xyz = bvh2xyz(s, chout(j, :));

		if j == 1
			xyz_pre = xyz ;	
		else
			xyz_pre = bvh2xyz(s, chout(j-1, :));
		end

		if(abs(xyz(13,2) - initfooty) < 0.01) & (xyz(13, 2) < xyz_pre(13, 2))
			footxyz(:) = xyz(13, :);
			footxyz(2) = initfooty ;
			left = false;
			[chout(j+1, :), d_ch(j+1, :)] = nextFrame(chout(j, :), d_ch(j,:), true);
			continue;
		end

		[chout(j+1, :), d_ch(j+1, :)] = nextFrame(chout(j, :), d_ch(j,:), false);
	else
		rootxyz=rootPos(s,chout(j,:),13,footxyz);
		chout(j,1)=rootxyz(1);
		chout(j,2)=rootxyz(2);
		chout(j,3)=rootxyz(3);



		xyz = bvh2xyz(s, chout(j, :));

		if j == 1
			xyz_pre = xyz ;	
		else
			xyz_pre = bvh2xyz(s, chout(j-1, :));
		end


		if (abs(xyz(9, 2) - initfooty) < 0.01) & (xyz(9, 2) < xyz_pre(9, 2))
			footxyz(:) = xyz(9, :);
			footxyz(2) = initfooty ;
			left = true;
			[chout(j+1, :), d_ch(j+1, :)] = nextFrame(chout(j, :), d_ch(j,:), true);
			continue;
		end
		[chout(j+1, :), d_ch(j+1, :)] = nextFrame(chout(j, :), d_ch(j,:), false);
	end

%{
	xyz=bvh2xyz(s,chout(locs1(i),:));
	footxyz=xyz(9,:);
	
	

	for j=locs1(i)+1:(locs2(i))
		rootxyz=rootPos(s,chout(j,:),9,footxyz);
		chout(j,1)=rootxyz(1);
		chout(j,2)=rootxyz(2);
		chout(j,3)=rootxyz(3);
		if xyz(13,2) < 0
			xyz(13, 2) = 0;
			switchleg();
		end
%		chout(j,43)=hindleg(chout(j,:), xyz(21,:), 21);
%		chout(j,61)=hindleg(chout(j,:), xyz(29,:), 29);
	end


	xyz=bvh2xyz(s,chout(locs2(i),:));
	footxyz=xyz(13,:);


	for j=locs2(i)+1:locs1(i+1)
		rootxyz=rootPos(s,chout(j,:),13,footxyz);
		chout(j,1)=rootxyz(1);
		chout(j,2)=rootxyz(2);
		chout(j,3)=rootxyz(3);
		if xyz(9, 2) < 0
			xyz(9, 2) = 0;
			switchleg();
		end

%		chout(j,52)=hindleg(chout(j,:), xyz(25,:), 25);
%		chout(j,70)=hindleg(chout(j,:), xyz(33,:), 33);
	end
%}

end

% chout(:, 4:end) = chout(:, 4:end)/pi*180;
