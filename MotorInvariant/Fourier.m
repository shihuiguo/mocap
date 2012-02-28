y=angle_hip2ankle;

figure;
plot(y);

% Set up the parameters
Fs=25;T=1/Fs;L=size(y,1);t=(0:L-1)*T;
% The next power of 2 from the length of signal;
NFFT = 2^nextpow2(L)

Y = fft(y,NFFT)/L;

f = Fs/2*linspace(0,1,NFFT/2+1);

figure;
plot(f,2*abs(Y(1:NFFT/2+1)));

xlabel('Frequency (Hz)')
ylabel('|Y(f)|')



