fs = 5000;
t = (0 : fs/10) ./ fs;
A = [1 2];
f = [500; 400];
xn = A * sin(2 * pi * f * t) + 0.1*randn(size(t));
ff = fs/length(xn)*((1:1:(length(xn)+1)/2));
nfft = length(xn);

subplot(4,2,1)%原信号
plot(t, xn)
Hrect = spectrum.periodogram;
%2 3 4比较，3最好，2 4 差不多
subplot(4,2,2)%周期图估计
psd(Hrect, xn, 'Fs', fs, 'NFFT',1024);
Hhamm = spectrum.periodogram('Hamming');

subplot(4,2,3)%hamming窗估计周期图
psd(Hhamm, xn, 'Fs', fs, 'NFFT',1024 );
Hs = spectrum.periodogram('rectangular');

subplot(4,2,4)%矩形窗周期图估计
psd(Hs, xn, 'Fs', fs, 'NFFT',1024);
Hs = spectrum.welch('rectangular', 150, 50);

%5和6比较，6好
subplot(4,2,5)%welch法周期图估计，使用150点，重合50点
psd(Hs, xn, 'Fs', fs, 'NFFT',512);
Hs = spectrum.welch('rectangula', 100, 75);

subplot(4,2,6)%welch法周期图估计，使用100点，重合75点
psd(Hs, xn, 'Fs', fs, 'NFFT',512);