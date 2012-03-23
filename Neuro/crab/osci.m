function [yout, dyout] = osci(y, dy, index)

% get y, return yout, the framerate is set as 1/120 = 0.0083
% index for channel to fetch the corresponding values in rou/offset

global lambda rou sigma omega offset;

rou_ch = rou(index);
offset_ch = offset(index);
omega_ch = omega(index);

% if you want to add an offset, then it should be added twice
y = y - offset_ch ;


temp = -lambda*((y^2+dy^2)/rou_ch^2-sigma);

yy = temp*y-omega_ch*dy;
dyy = omega_ch*y+temp*dy;


% You also need it here
yout = y + yy*0.0083 + offset_ch ;
dyout = dy + dyy*0.0083 ;


