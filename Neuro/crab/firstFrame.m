function [ch, d_ch] = firstFrame()

% initialize the derivatives of the channels for first frame
% Think about No. 19/10 first

ch = zeros(1, 78);
d_ch = zeros(size(ch));

ch(19) = 0;
ch(28) = 30;
ch(22) = -45;
ch(31) = -45;

d_ch(19) = 0;
d_ch(28) = 0;
d_ch(22) = 15;
d_ch(31) = -15;
