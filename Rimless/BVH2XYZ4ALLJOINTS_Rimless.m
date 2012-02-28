% Read the bvh file and transform all the channels into 3D world xyz coordinates
% then calculate the Hip2Ankle and Hip2Knee angles

clear;
[s,c,f]=bvhReadFile('examples/07_01.bvh');
% s.tree(5) is the LeftFoot, do with this one first
% s.tree(33) is the RightHand.

numFrame=size(c,1);
numJoint=size(s.tree,2);
motionxyz=zeros(numFrame,numJoint,3);
for i=1:numFrame
	motionxyz(i,:,:)=bvh2xyz(s,c(i,:));
end
% The calculated is zyx, not xyz
%temp=motionxyz(:,:,1);
%motionxyz(:,:,1)=motionxyz(:,:,3);
%motionxyz(:,:,3)=temp;

Hip2Ankle_Rimless;


