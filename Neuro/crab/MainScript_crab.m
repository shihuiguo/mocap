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




ControlParam_crab;       % Load control parameters


%%%% Simulation Start %%%%
[T, Y]=ode45(@Controller,[0,60],[1 0]);

Y_out=phase_tran(Y,pi);


[s,c,f]=bvhReadFile('guo/Neuro/crab/test6.bvh');

frames=size(Y,1);
num_ch=size(c,2);


c=zeros(frames,num_ch);
c(:,19)=Y(:,1);
c(:,37)=Y(:,1);
c(:,46)=Y(:,1);
c(:,64)=Y(:,1);


c(:,10)=Y_out(:,1);
c(:,28)=Y_out(:,1);
c(:,55)=Y_out(:,1);
c(:,73)=Y_out(:,1);

c(:,4:end)=c(:,4:end)/pi*180;

%{
[pks1,locs1]=findpeaks(Y(:,1));
[pks2,locs2]=findpeaks(Y_out(:,1));

yin=Y(locs1(2):locs1(5),1);

arrayjoints=[37 46 64 10 55 73];

for i=1:3

	tmp=[];
	while(length(tmp)<frames)
	
		rnd=0.9+0.2*rand(1);
		yout=changeduty(yin,rnd);
		[youtpks,youtlocs]=findpeaks(yout,'minpeakdistance',40);
		yout2=yout(youtlocs(2):youtlocs(3));
		tmp=[tmp; yout2];
	end
	c(:,arrayjoints(i))=tmp(1:frames);
end


for i=4:6

	tmp=[];
	while(length(tmp)<frames)
	
		rnd=0.9+0.2*rand(1);
		yout=changeduty(-yin,rnd);
		[youtpks,youtlocs]=findpeaks(yout,'minpeakdistance',40);
		yout2=yout(youtlocs(2):youtlocs(3));
		tmp=[tmp; yout2];
	end
	c(:,arrayjoints(i))=tmp(1:frames);
end



if(locs1(1)>locs2(1))
	pks2=pks2(2:end);
	locs2=locs2(2:end);
end

%numCycle=length(locs1)-1;

%kneeMotion=freq_tran(Y(:,1),2);
%[kneepks,kneelocs]=findpeaks(kneeMotion,'minpeakdistance',40);
%kneeUnit=kneeMotion(kneelocs(2):kneelocs(3));



for i=1:numCycle
% Lock the Left knee, standing

	c(locs1(i):locs2(i),22)=-pks1(i+1)*kneeAmp+kneeOff;
	c(locs1(i):locs2(i),40)=-pks1(i+1)*kneeAmp+kneeOff;
	c(locs1(i):locs2(i),58)=-pks1(i+1)*kneeAmp+kneeOff;
% The Right knee, swinging
	gap=locs1(i)-locs2(i)-(kneelocs(2)-kneelocs(3));
	if (gap==-1)
		kneeSwing=[kneeUnit; kneepks(3)];
	elseif (gap==1)
		kneeSwing=kneeUnit(1:end);
	elseif (gap==0)
		kneeSwing=kneeUnit;
	end

%	c(locs1(i):locs2(i),13)=-kneeSwing*kneeAmp+kneeOff;
%	c(locs1(i):locs2(i),31)=-kneeSwing*kneeAmp+kneeOff;
%	c(locs1(i):locs2(i),49)=-kneeSwing*kneeAmp+kneeOff;

	c(locs1(i):locs2(i),22)=-(-pks1(i+1)*kneeAmp+kneeOff);
	c(locs1(i):locs2(i),40)=-(-pks1(i+1)*kneeAmp+kneeOff);
	c(locs1(i):locs2(i),49)=-pks1(i+1)*kneeAmp+kneeOff;
	c(locs1(i):locs2(i),67)=-pks1(i+1)*kneeAmp+kneeOff;	

%	c(locs1(i),1:3)=c(locs1(i)-1,1:3);
	xyz=bvh2xyz(s,c(locs1(i),:));
	footxyz=xyz(9,:);

	for j=locs1(i)+1:(locs2(i))
		rootxyz=rootPos(s,c(j,:),9,footxyz);
		c(j,1)=rootxyz(1);
		c(j,2)=rootxyz(2);
		c(j,3)=rootxyz(3);
	end

%%%%%%%%%%%%%%%%%%%%%%
% Switch leg here

% Lock the Right knee, standing
	c(locs1(i):locs2(i),13)=-pks1(i+1)*kneeAmp+kneeOff;
	c(locs1(i):locs2(i),31)=-pks1(i+1)*kneeAmp+kneeOff;
	c(locs1(i):locs2(i),49)=-pks1(i+1)*kneeAmp+kneeOff;
% The Left knee, swinging
	gap=locs1(i)-locs2(i)-(kneelocs(2)-kneelocs(3));
	if (gap==-1)
		kneeSwing=[kneeUnit; kneepks(3)];
	elseif (gap==1)
		kneeSwing=kneeUnit(1:end);
	elseif (gap==0)
		kneeSwing=kneeUnit;
	end

%	c(locs1(i):locs2(i),22)=-kneeSwing*kneeAmp+kneeOff;
%	c(locs1(i):locs2(i),40)=-kneeSwing*kneeAmp+kneeOff;
%	c(locs1(i):locs2(i),58)=-kneeSwing*kneeAmp+kneeOff;

	gap=locs2(i)-locs1(i+1)-(kneelocs(2)-kneelocs(3));
	if (gap==-1)
		kneeSwing=[kneeUnit; kneepks(3)];
	elseif (gap==1)
		kneeSwing=kneeUnit(1:end);
	elseif (gap==0)
		kneeSwing=kneeUnit;
	end

	c(locs2(i):locs1(i+1),22)=-(-kneeSwing*kneeAmp+kneeOff);
	c(locs2(i):locs1(i+1),40)=-(-kneeSwing*kneeAmp+kneeOff);
	c(locs2(i):locs1(i+1),49)=-kneeSwing*kneeAmp+kneeOff;
	c(locs2(i):locs1(i+1),67)=-kneeSwing*kneeAmp+kneeOff;


%	c(locs2(i),1:3)=c(locs2(i)-1,1:3);
	xyz=bvh2xyz(s,c(locs2(i),:));
	footxyz=xyz(13,:);

	for j=locs2(i)+1:locs1(i+1)
		rootxyz=rootPos(s,c(j,:),13,footxyz);
		c(j,1)=rootxyz(1);
		c(j,2)=rootxyz(2);
		c(j,3)=rootxyz(3);

	end

end
%}



%Fillgap_crab;
%c=c(locs1(1):locs1(end)-1,:);


