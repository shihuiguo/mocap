function Curvature=AFFINE_Curvature(curve)

% S GUO
% Compute the Affine Curvature for a 2D curve curve(n,2)
% Reference Link: http://en.wikipedia.org/wiki/Affine_curvature

vsize=size(curve,1);
Curvature=zeros(vsize,1);

x=curve(:,1);
y=curve(:,2);

dx=gradient(x);
dy=gradient(y);
ddx=gradient(dx);
ddy=gradient(dy);
dddx=gradient(ddx);
dddy=gradient(ddy);
ddddx=gradient(dddx);
ddddy=gradient(dddy);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%		a		c
%	k= ----	- -----
%		b		d
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


for i=3:vsize-3
	temp1=det([ddx(i) ddy(i);dddx(i) dddy(i)]);
	temp2=det([dx(i) dy(i);ddddx(i) ddddy(i)]);
	temp3=det([dx(i) dy(i);ddx(i) ddy(i)]);
	temp4=det([dx(i) dy(i);dddx(i) dddy(i)]);
	temp5=det([dx(i) dy(i);ddx(i) ddy(i)]);

	a=4*temp1+temp2;
	b=3*nthroot(temp3^5,3);
	c=5*temp4^2;
	d=9*nthroot(temp5^8,3);

	Curvature(i)=a/b-c/d;
end
