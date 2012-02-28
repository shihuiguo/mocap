% Script file: 
%       MainScript.m
%
% Purpose:
%       Simulation of motion
%
% Revisions:
%       Date          Programmer      Description
%
%       2011.08.02    S. GUO	   Original code
%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Problems:
%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%% Clear Previous Values %%%%
%warning off all;
clear all;




ControlParam_ant;       % Load control parameters


%%%% Simulation Start %%%%
[T, Y]=ode45(@Controller,[0,60],[1 0]);

Y_out=phase_tran(Y,pi);


[s,c,f]=bvhReadFile('guo/Neuro/ant/ant.bvh');

vsize=size(Y,1);
frames=size(c,1);
vsize=max(vsize,frames);
numCh=size(c,2);

%c_test=resample(c,vsize,frames);
c_test=zeros(vsize,numCh);
c_test(:,7:end)=0;
c_test(:,1)=c_test(1,1);
c_test(:,2)=c_test(1,2);

c_test(:,7)=pi/6;
c_test(:,28)=-pi/6;
c_test(:,43)=-pi/6;
c_test(:,13)=-pi/6;
c_test(:,22)=pi/6;
c_test(:,37)=pi/6;

c_test(:,9)=Y(:,1);
c_test(:,30)=-Y(:,1);
c_test(:,45)=-Y(:,1);

c_test(:,15)=-Y_out(:,1);
c_test(:,24)=Y_out(:,1);
c_test(:,39)=Y_out(:,1);







[pks1,locs1]=findpeaks(Y(:,1));
[pks2,locs2]=findpeaks(Y_out(:,1));
if(locs1(1)>locs2(1))
	pks2=pks2(2:end);
	locs2=locs2(2:end);
end
numCycle=length(locs1)-1;

kneeUnit=(Y(locs1(1):locs2(1),1)+pks1(1))/2;

maxknee=max(kneeUnit);

klen=length(kneeUnit);

kneemotion=phase_tran(Y,3*pi/2);

kneemotion=abs(kneemotion(:,1));


for i=1:numCycle
%{
	gap=locs2(i)-locs1(i)+1-klen;
	if (gap==1)
		kneeSwing=[kneeUnit; 0];
	elseif (gap==-1)
		kneeSwing=kneeUnit(1:end-1);
	elseif (gap==0)
		kneeSwing=kneeUnit;
	end
	
	c_test(locs1(i):locs2(i),11)=kneeSwing;
	c_test(locs1(i):locs2(i),32)=kneeSwing;
	c_test(locs1(i):locs2(i),47)=kneeSwing;

	c_test(locs1(i):locs2(i),17)=linspace(0,maxknee,locs2(i)-locs1(i)+1);
	c_test(locs1(i):locs2(i),26)=linspace(0,maxknee,locs2(i)-locs1(i)+1);
	c_test(locs1(i):locs2(i),41)=linspace(0,maxknee,locs2(i)-locs1(i)+1);

%}
	c_test(locs1(i):locs2(i),11)=-kneemotion(locs1(i):locs2(i));
	c_test(locs1(i):locs2(i),32)=-kneemotion(locs1(i):locs2(i));
	c_test(locs1(i):locs2(i),47)=-kneemotion(locs1(i):locs2(i));

	c_test(locs1(i)-1,1:3)=c_test(locs1(i)-2,1:3);
	zyx=bvh2xyz(s,c_test(locs1(i)-1,:));
	footxyz=zyx(7,:);
	for j=locs1(i):(locs2(i)-1)
%		hipx=footxyz(1)+;
		hipy=footxyz(2)+2*cos(c_test(j,15))+5*cos(c_test(j,17));
		hipz=footxyz(3)-2*sin(c_test(j,15))+5*sin(c_test(j,17));
		c_test(j,2)=hipy;
		c_test(j,3)=hipz;
	end
%{
	gap=locs1(i+1)-locs2(i)+1-klen;
	if (gap==1)
		kneeSwing=[kneeUnit; 0];
	elseif (gap==-1)
		kneeSwing=kneeUnit(1:end-1);
	elseif (gap==0)
		kneeSwing=kneeUnit;
	end	

	c_test(locs2(i):locs1(i+1),17)=kneeSwing;
	c_test(locs2(i):locs1(i+1),26)=kneeSwing;
	c_test(locs2(i):locs1(i+1),41)=kneeSwing;

	c_test(locs2(i):locs1(i+1),11)=linspace(0,maxknee,locs1(i+1)-locs2(i)+1);
	c_test(locs2(i):locs1(i+1),32)=linspace(0,maxknee,locs1(i+1)-locs2(i)+1);
	c_test(locs2(i):locs1(i+1),47)=linspace(0,maxknee,locs1(i+1)-locs2(i)+1);
%}

	c_test(locs2(i):locs1(i+1),17)=-kneemotion(locs2(i):locs1(i+1));
	c_test(locs2(i):locs1(i+1),26)=-kneemotion(locs2(i):locs1(i+1));
	c_test(locs2(i):locs1(i+1),41)=-kneemotion(locs2(i):locs1(i+1));

	c_test(locs1(i)-1,1:3)=c_test(locs1(i)-2,1:3);
	zyx=bvh2xyz(s,c_test(locs2(i)-1,:));
	footxyz=zyx(4,:);
	for j=locs2(i):(locs1(i+1)-1)
%		hipx=footxyz(1)+;
		hipy=footxyz(2)+2*cos(c_test(j,9))+5*cos(c_test(j,11));
		hipz=footxyz(3)+2*sin(c_test(j,9))+5*sin(c_test(j,11));
		c_test(j,2)=hipy;
		c_test(j,3)=hipz;
	end
end

Fillgap_ant;

c_test(:,4:end)=c_test(:,4:end)/pi*180;

c_test=c_test(locs1(1):locs1(end)-1,:);
%{
c_test(:,7:end)=0;
c_test(:,1)=c_test(1,1);
c_test(:,2)=c_test(1,2);
c_test(:,11)=Y(:,1);
c_test(:,50)=Y(:,1);
c_test(:,23)=Y_out(:,1);
c_test(:,38)=Y_out(:,1);
[pks1,locs1]=findpeaks(Y(:,1));
[pks2,locs2]=findpeaks(Y_out(:,1));
if(locs1(1)>locs2(1))
	pks2=pks2(2:end);
	locs2=locs2(2:end);
end
numCycle=length(locs1)-1;

% Compute the kneeSwing and kneeStand
cutpos=13;
temp=0.5*(Y(:,1)+rou);
[pktemp,lctemp]=findpeaks(-temp);
swinging=temp(lctemp(1):lctemp(2)-cutpos-1);
standing=temp(lctemp(2)-cutpos:lctemp(2));




for i=1:numCycle
% In a cycle, there should be a switch between standing and swinging. These special treatments only apply to knee

% lock the right knee, standing
	standing_unit=resample(standing,locs2(i)-locs1(i)+1,cutpos+1);
	c_test(locs1(i):locs2(i),26)=standing_unit;
	c_test(locs1(i):locs2(i),41)=standing_unit;

% the left knee, swinging	
	swinging_unit=resample(swinging,locs2(i)-locs1(i)+1,lctemp(2)-lctemp(1)-cutpos);

	c_test(locs1(i):locs2(i),14)=swinging_unit;
	c_test(locs1(i):locs2(i),53)=swinging_unit;

%	c_test(locs1(i)-1,1:3)=c_test(locs1(i)-2,1:3);

	zyx=bvh2xyz(s,c_test(locs1(i)-1,:));
	footzyx=zyx(9,:);

% recalculate the hip position using forward kinematics
	for j=locs1(i):(locs2(i)-1)
%		hipy=footzyx(2)+6*cos((c_test(j,14)-c_test(j,11))/pi)+5*cos(c_test(j,11)/pi);
%		hipz=footzyx(3)+6*sin((c_test(j,14)-c_test(j,11))/pi)-5*sin(c_test(j,11)/pi);;
		hipy=footzyx(2)+6*cos(c_test(j,26)+c_test(j,23))+5*cos(c_test(j,23));
		hipz=footzyx(3)+6*sin(c_test(j,26)+c_test(j,23))+5*sin(c_test(j,23));
		c_test(j,2)=hipy;
		c_test(j,3)=hipz;
	end

%%%%%%%%%%%%%%%%%%%%
% Swtich Leg Here
% lock the right knee, standing
	standing_unit=resample(standing,locs1(i+1)-locs2(i)+1,cutpos+1);

	c_test(locs2(i):locs1(i+1),14)=standing_unit;
	c_test(locs2(i):locs1(i+1),53)=standing_unit;


%%%
% the left knee swinging
	swinging_unit=resample(swinging,locs1(i+1)-locs2(i)+1,lctemp(2)-lctemp(1)-cutpos);

	c_test(locs2(i):locs1(i+1),26)=swinging_unit;
	c_test(locs2(i):locs1(i+1),41)=swinging_unit;

%	c_test(locs2(i)-1,1:3)=c_test(locs2(i)-2,1:3);

	zyx=bvh2xyz(s,c_test(locs2(i)-1,:));
	footzyx=zyx(5,:);

% recalculate the hip position using forward kinematics
	for j=locs2(i):(locs1(i+1)-1)
%		hipy=footzyx(2)+6*cos((c_test(j,26)-c_test(j,23))/pi)+5*cos(c_test(j,23)/pi);
%		hipz=footzyx(3)+6*sin((c_test(j,26)-c_test(j,23))/pi)-5*sin(c_test(j,23)/pi);;
		hipy=footzyx(2)+6*cos(c_test(j,14)+c_test(j,14))+5*cos(c_test(j,11));
		hipz=footzyx(3)+6*sin(c_test(j,14)+c_test(j,11))+5*sin(c_test(j,11));
		c_test(j,2)=hipy;
		c_test(j,3)=hipz;
	end

end

%%%%%%%%%%%%%%%%%%%%
% the parameter doesn't matter, add the push to the character
%push=recover_push(1);

%vsize=size(push,1);

%c_test(201:200+vsize,1)=c_test(201:200+vsize,1)+push(:,1);
%%%%%%%%%%%%%%%%%%%%

c_test(:,4:end)=c_test(:,4:end)/pi*180;

Fillgap;
c_test=c_test(locs1(1):locs1(end)-1,:);
%}
