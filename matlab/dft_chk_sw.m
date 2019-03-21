clear;clc;
% sig=csvread('DFT_data.dat',1,0);
fs = 5000;
t = (0 : fs/10) ./ fs;
A = [1 2];
f = [500; 400];
sig = A * sin(2 * pi * f * t) + 0.1*randn(size(t));
nfft=length(sig);       % ���ݳ��ȣ�Ҳ����Ƶ�ʵ���
window=rectwin(nfft);   % ���δ�
% fs=10;                  % ������

% �Լ����㹦����
xf=fft(sig,nfft);
fxx=0:nfft-1;           % ����Ƶ�ʵ�
fxx=fxx*fs/nfft;
pxx=2/(nfft*fs)*(abs(xf)).^2;   % ���������߶���ʽ�������ܶ�

subplot(3,1,1)
plot(t,sig)

subplot(3,1,2)
plot(xf)

subplot(3,1,3)
[px,f]=periodogram(sig,window,'oneside',nfft,fs);   % ����ͼ��
loglog(fxx(1:(length(fxx)+1)/2),sqrt(pxx(1:(length(pxx)+1)/2)),'g')
hold on
loglog(f,sqrt(px),'--r')
grid on


% �����������ڣ��Լ�д�ĺ���û����fs/2���ض�