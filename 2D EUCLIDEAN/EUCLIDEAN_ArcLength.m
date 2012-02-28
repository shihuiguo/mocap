function Len=EUCLIDEAN_ArcLength(curve)

% S GUO
% It computes the Euclidean arclength for a 2D curve(n,2)

vsize=size(curve,1);
Len=zeros(vsize,1);

x=curve(:,1);
y=curve(:,2);
dx=gradient(x);
dy=gradient(y);
ddx=gradient(dx);
ddy=gradient(dy);

for i=2:vsize
	Len(i)=Len(i-1)+sqrt(dx(i)^2+dy(i)^2);
end
