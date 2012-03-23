function f = hipfun(x, c, footxyz, index)

global skel;

switch index
	case 21
		c(:,43) = x;
	case 25
		c(:,52) = x;
	case 29
		c(:,61) = x;
	case 33
		c(:,70) = x;
end

motionxyz=bvh2xyz(skel,c);

f=(motionxyz(index,2)-footxyz(2))^2;
