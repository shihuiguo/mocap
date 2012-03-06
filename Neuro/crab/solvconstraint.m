global skel channels Yopt;

skel = s;

[pks1,locs1]=findpeaks(Y(:,1));
[pks2,locs2]=findpeaks(Y_out(:,1));

channels = c(locs1(2):locs2(3),:);
Yopt=Y;

options = optimset('Display','iter');
[x, fval]=fminbnd(@optfun,0,6, options)


