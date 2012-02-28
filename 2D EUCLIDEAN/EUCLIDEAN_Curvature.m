function Curvature=EUCLIDEAN_Curvature(curve)

% S GUO
% Compute the EUCLIDEAN Curvature for a 2D curve curve(n,2)
% Reference Link: http://en.wikipedia.org/wiki/Curvature

vsize=size(curve,1);
Curvature=zeros(vsize,1);

x=curve(:,1);
y=curve(:,2);
dx=gradient(x);
dy=gradient(y);
ddx=gradient(dx);
ddy=gradient(dy);

for i=1:vsize
	temp1=det([dx(i) dy(i);ddx(i) ddy(i)]);
	temp2=dx(i)^2+dy(i)^2;
	Curvature(i)=temp1/temp2^(3/2);
end

