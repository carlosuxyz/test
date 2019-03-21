clear;clc;
sig=csvread('DFT_data.dat',1,0);
nfft=length(sig);       % ���ݳ��ȣ�Ҳ����Ƶ�ʵ���
window=rectwin(nfft);   % ���δ�
fs=10;                  % ������

% �Լ����㹦����
xf=fft(sig.*window,nfft); % OR: xf=fft(sig,nfft);
fxx=0:nfft-1;           % ����Ƶ�ʵ�
fxx=fxx*fs/nfft;
pxx=2/(nfft*fs)*(abs(xf)).^2;   % ���������߶���ʽ�������ܶ�

[px,f]=periodogram(sig,window,'oneside',nfft,fs);   % ����ͼ��
loglog(fxx,sqrt(pxx),'g')
hold on
loglog(f,sqrt(px),'r')
grid on


% �����������ڣ��Լ�д�ĺ���û����fs/2���ض�