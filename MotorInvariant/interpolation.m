vsize=size(channels,2)

channels2=channels2(2:end,:);

if(channels2(1,3)<=channels(end,3))

	channels2(:,3)=channels2(:,3)+(channels(end,3)-channels2(1,3))+4;
end

if(channels2(1,1)<=channels(end,1))
	channels2(:,1)=channels2(:,1)+(channels(end,1)-channels2(1,1));
else
	channels2(:,1)=channels2(:,1)+(channels2(1,1)-channels(end,1));	
end

if(channels2(1,2)<=channels(end,2))
	channels2(:,2)=channels2(:,2)+(channels(end,2)-channels2(1,2));
else
	channels2(:,2)=channels2(:,2)+(channels2(1,2)-channels(end,2));
end

num=40;

for i=1:1:num
	for j=1:1:vsize
		transition(i,j)=(num-i)/num*channels(end,j)+i/num*channels2(1,j);
	end
end

final=cat(1,channels,transition,channels2);

bvhPlayData(skel2,final,frameLength);
