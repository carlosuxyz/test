fs = 5000;
t = (0 : fs/10) ./ fs;
A = [1 2];
f = [500; 400];
xn = A * sin(2 * pi * f * t) + 0.1*randn(size(t));
ff = fs/length(xn)*((1:1:(length(xn)+1)/2));
nfft = length(xn);

subplot(4,2,1)%ԭ�ź�
plot(t, xn)
Hrect = spectrum.periodogram;
%2 3 4�Ƚϣ�3��ã�2 4 ���
subplot(4,2,2)%����ͼ����
psd(Hrect, xn, 'Fs', fs, 'NFFT',1024);
Hhamm = spectrum.periodogram('Hamming');

subplot(4,2,3)%hamming����������ͼ
psd(Hhamm, xn, 'Fs', fs, 'NFFT',1024 );
Hs = spectrum.periodogram('rectangular');

subplot(4,2,4)%���δ�����ͼ����
psd(Hs, xn, 'Fs', fs, 'NFFT',1024);
Hs = spectrum.welch('rectangular', 150, 50);

%5��6�Ƚϣ�6��
subplot(4,2,5)%welch������ͼ���ƣ�ʹ��150�㣬�غ�50��
psd(Hs, xn, 'Fs', fs, 'NFFT',512);
Hs = spectrum.welch('rectangula', 100, 75);

subplot(4,2,6)%welch������ͼ���ƣ�ʹ��100�㣬�غ�75��
psd(Hs, xn, 'Fs', fs, 'NFFT',512);