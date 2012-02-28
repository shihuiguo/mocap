diffy=diff(c(:,2));

[diffpks,difflocs]=findpeaks(-diffy,'minpeakheight',0.1);

for i=1:length(difflocs)
	c(difflocs(i)+1:end,2)=c(difflocs(i)+1:end,2)+diffpks(2);

end

diffx=diff(c(:,1));

[diffpks,difflocs]=findpeaks(-diffx,'minpeakheight',0.5);

for i=1:length(difflocs)
	c(difflocs(i)+1:end,1)=c(difflocs(i)+1:end,1)+diffpks(i);

end
