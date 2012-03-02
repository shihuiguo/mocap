function trMat = transfMatrix(rotMat,offset)

trMat=zeros(4,4);

trMat(1:3,1:3)=rotMat;
trMat(:,4)=[offset 1];
