% Here let's just select the Left Ankle <s.tree(4)>, Hip <s.tree(1)>. And compute the angle between hip-ankle and the vertical line (relative to the ground)

% Left and Right
angle_hip2ankle=zeros(numFrame,2);
delta_z=zeros(numFrame,2);
delta_y=zeros(numFrame,2);

%	Horizontal distance between hip and ankle
delta_z(:,1)=motionxyz(:,1,3)-motionxyz(:,5,3);
delta_z(:,2)=motionxyz(:,1,3)-motionxyz(:,11,3);

%	Vertical distance between hip and ankle
delta_y(:,1)=motionxyz(:,1,2)-motionxyz(:,5,2);
delta_y(:,2)=motionxyz(:,1,2)-motionxyz(:,11,2);

%	Inverse tangent
angle_hip2ankle(:,1)=atan(delta_z(:,1)./delta_y(:,1));
angle_hip2ankle(:,2)=atan(delta_z(:,2)./delta_y(:,2));



