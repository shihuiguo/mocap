interp_step=0.2;

vsize=size(A);


for i=1:vsize(2)
	FinalCycleArray(:,i)=interp1(1:vsize(1),A(:,i),1:interp_step:vsize(1),'spline');
end
