% Here let's just select the Left Knee <s.tree(3)>, Hip <s.tree(1)>. And compute the angle between hip-Knee and the vertical line (relative to the ground)

angle_hip2knee=zeros(numFrame);
delta_z=zeros(numFrame);
delta_y=zeros(numFrame);

%	Horizontal distance between hip and ankle
delta_z=motionxyz(:,1,3)-motionxyz(:,3,3);

%	Vertical distance between hip and ankle
delta_y=motionxyz(:,1,2)-motionxyz(:,3,2);

%	Inverse tangent
angle_hip2knee=atan(delta_z./delta_y);


