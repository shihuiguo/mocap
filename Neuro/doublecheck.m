for i=locs1(2):locs1(3)
	bvhPlayData(s,c_test(i,:),f);
	view(-90,0);
	strResponse=input('Do you want to delete this cycle? y/n','s');
end
