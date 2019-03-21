clear;clc;
% sig=csvread('DFT_data.dat',1,0);
fs = 5000;
t = (0 : fs/10) ./ fs;
A = [1 2];
f = [500; 400];
sig = A * sin(2 * pi * f * t) + 0.1*randn(size(t));
nfft=length(sig);       % 数据长度，也等于频率点数
window=rectwin(nfft);   % 矩形窗
% fs=10;                  % 采样率

% 自己计算功率谱
xf=fft(sig,nfft);
fxx=0:nfft-1;           % 计算频率点
fxx=fxx*fs/nfft;
pxx=2/(nfft*fs)*(abs(xf)).^2;   % 根据怕赛瓦尔等式计算谱密度

subplot(3,1,1)
plot(t,sig)

subplot(3,1,2)
plot(xf)

subplot(3,1,3)
[px,f]=periodogram(sig,window,'oneside',nfft,fs);   % 周期图法
loglog(fxx(1:(length(fxx)+1)/2),sqrt(pxx(1:(length(pxx)+1)/2)),'g')
hold on
loglog(f,sqrt(px),'--r')
grid on


% 两者区别在于，自己写的函数没有在fs/2处截断