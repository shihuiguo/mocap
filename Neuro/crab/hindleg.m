function ch = hindleg(c, footxyz, index)

% Given the position of the root and foot, return the channel value of the hip rotation on x-axis. The simplest solution.
% c is per-frame channel only

[ch, fval] = fminbnd(@(x)hipfun(x, c, footxyz,index),0,60);

