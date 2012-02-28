% Here let's just select the Left Ankle <s.tree(4)>, Hip <s.tree(1)>. And compute the angle between hip-ankle and the vertical line (relative to the ground)

angle_hip2ankle=zeros(numFrame);
delta_z=zeros(numFrame);
delta_y=zeros(numFrame);

%	Horizontal distance between hip and ankle
delta_z=motionxyz(:,1,3)-motionxyz(:,4,3);

%	Vertical distance between hip and ankle
delta_y=motionxyz(:,1,2)-motionxyz(:,4,2);

%	Inverse tangent
angle_hip2ankle=atan(delta_z./delta_y);


