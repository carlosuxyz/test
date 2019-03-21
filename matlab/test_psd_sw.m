fs = 5000; %采样频率
ts = 1/fs; %采样间隔
T = fs/10; %时长
tn = (0 : T) .* ts; %(0 : fs/10)./ fs; %时序
nfft = length(tn);
fx = 0:length(tn)-1; %频率序列
fx = fs * fx/length(tn); %频率序列

A = [1 2];
f0 = [500; 400];
xn = A * sin(2 * pi * f0 * tn) + 0.1*randn(size(tn));
nfft = length(xn);

% 自己算 psd tf_x^2/(nfft*fs)
tf_x = fft(xn,nfft);
pxx0 = abs(tf_x).^2/(nfft*fs);

% periodogram1 矩形窗
window=rectwin(nfft);   % 矩形窗
[pxx_p,f_p] = periodogram(xn,window,'oneside',nfft,fs);
% periodogram2 hamming窗
[pxx_p_hamming,f_p_hamming] = periodogram(xn,hamming(length(xn)),'oneside',nfft,fs);

% pwelch
pxx_pwelch1 = pwelch(xn,100,20,nfft);
pxx_pwelch2 = pwelch(xn,100,50,nfft);
pxx_pwelch3 = pwelch(xn,250,50,nfft);

%welch
% pxx_welch = spectrum.welch(xn,250,100,nfft)

% plot
subplot(3,2,1)
semilogy(fx(1:(length(fx)+1)/2),abs(tf_x(1:(length(tf_x)+1)/2))/nfft);
title('FFT normalization')

subplot(3,2,3)
semilogy(fx(1:(length(fx)+1)/2),sqrt(pxx0(1:(length(fx)+1)/2)));
hold on 
semilogy(fx(1:(length(fx)+1)/2), sqrt(pxx_p),'--')
title('PSD definition')

subplot(3,2,5)
semilogy(f_p_hamming,sqrt(pxx_p_hamming));
title('PSD periodogram hamming')

subplot(3,2,2)
semilogy(fx(1:(length(fx)+1)/2),sqrt(pxx_pwelch1));
title('PSD pwelch test1')

subplot(3,2,4)
semilogy(fx(1:(length(fx)+1)/2),sqrt(pxx_pwelch2));
title('PSD pwelch test2')

subplot(3,2,6)
semilogy(fx(1:(length(fx)+1)/2),sqrt(pxx_pwelch3));
title('PSD pwelch test3')
