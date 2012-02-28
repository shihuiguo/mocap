diffy=diff(c_test(:,2));

[diffpks,difflocs]=findpeaks(-diffy,'minpeakheight',0.4);

for i=1:length(difflocs)
	c_test(difflocs(i)+1:end,2)=c_test(difflocs(i)+1:end,2)+diffpks(i);

end

diffz=diff(c_test(:,3));

[diffpks,difflocs]=findpeaks(-diffz,'minpeakheight',1);

for i=1:length(difflocs)
	c_test(difflocs(i)+1:end,3)=c_test(difflocs(i)+1:end,3)+diffpks(i);

end
