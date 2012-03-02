function rtPos=rootPos(skel, channels, index, childwld)

% Given the world coordinate of a joint (in most cases, it is the end-effectors), calculate the root position
% index is the index number for this joint in the skeletal structure, childwld is the world coordinate for this joint

% First construct the rotStruct
for i = 1:length(skel.tree)  
  if ~isempty(skel.tree(i).posInd)
    xpos = channels(skel.tree(i).posInd(1));
    ypos = channels(skel.tree(i).posInd(2));
    zpos = channels(skel.tree(i).posInd(3));
  else
    xpos = 0;
    ypos = 0;
    zpos = 0;
  end
  rotStruct(i) = struct('rotation', []); 
  if nargin < 2 | isempty(skel.tree(i).rotInd)
    xangle = 0;
    yangle = 0;
    zangle = 0;
  else
    xangle = deg2rad(channels(skel.tree(i).rotInd(1)));
    yangle = deg2rad(channels(skel.tree(i).rotInd(2)));
    zangle = deg2rad(channels(skel.tree(i).rotInd(3)));
  end
  thisRotation = rotationMatrix(xangle, yangle, zangle, skel.tree(i).order);
%  thisPosition = [xpos ypos zpos];
  if ~skel.tree(i).parent
    rotStruct(i).rotation = thisRotation;
%    xyzStruct(i).xyz = skel.tree(i).offset + thisPosition;
  else
%    xyzStruct(i).xyz = ...
%        (skel.tree(i).offset + thisPosition)*xyzStruct(skel.tree(i).parent).rotation ...
%        + xyzStruct(skel.tree(i).parent).xyz;
    rotStruct(i).rotation = thisRotation*rotStruct(skel.tree(i).parent).rotation;
    
  end
end


while skel.tree(index).parent ~= 0

	off 	= skel.tree(index).offset;
	rtPos 	= childwld - off*rotStruct(skel.tree(index).parent).rotation;
	childwld = rtPos;
	index=skel.tree(index).parent;
end

end

