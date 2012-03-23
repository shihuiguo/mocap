function xyz=jointxyz(s, c, index)

% calculate the joint trajectory in world space for specific joint No. index

numFrames=size(c,1);
xyz=zeros(numFrames,3);

for i=1:numFrames
	motionxyz=bvh2xyz(s,c(i,:));
	xyz(i,:)=motionxyz(index,:);
end
