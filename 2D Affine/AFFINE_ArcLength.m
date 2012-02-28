function Len=AFFINE_ArcLength(curve)

% S GUO
% It computes the affine arclength for a 2D curve(n,2)
% Reference Link: http://en.wikipedia.org/wiki/Affine_curvature

vsize=size(curve,1);
Len=zeros(vsize,1);

x=curve(:,1);
y=curve(:,2);
dx=gradient(x);
dy=gradient(y);
ddx=gradient(dx);
ddy=gradient(dy);

for i=2:vsize
	temp=[dx(i) dy(i);ddx(i) ddy(i)];
	Len(i)=Len(i-1)+nthroot(det(temp),3);
end
