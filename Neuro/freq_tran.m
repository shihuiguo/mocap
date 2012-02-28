function Y_out=freq_fun(Y, param);

Y_out=resample(Y,floor(size(Y,1)/param),size(Y,1));

end
