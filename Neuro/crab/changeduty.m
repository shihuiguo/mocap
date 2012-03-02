function yout=changeduty(y, ratio)

vlen=length(y);
vlen_2=round(vlen*ratio);

yout=resample(y,vlen,vlen_2);
