clear;clc;
sig=csvread('DFT_data.dat',1,0);
nfft=length(sig);       % 数据长度，也等于频率点数
window=rectwin(nfft);   % 矩形窗
fs=10;                  % 采样率

% 自己计算功率谱
xf=fft(sig.*window,nfft); % OR: xf=fft(sig,nfft);
fxx=0:nfft-1;           % 计算频率点
fxx=fxx*fs/nfft;
pxx=2/(nfft*fs)*(abs(xf)).^2;   % 根据怕赛瓦尔等式计算谱密度

[px,f]=periodogram(sig,window,'oneside',nfft,fs);   % 周期图法
loglog(fxx,sqrt(pxx),'g')
hold on
loglog(f,sqrt(px),'r')
grid on


% 两者区别在于，自己写的函数没有在fs/2处截断