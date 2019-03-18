nsamp = 5000
t = (0:1212)/nsamp;
a1 = 12
a2 = 2
a3 = 5
phi = a1 + a2*t + a3*t.^2;

sigVec1 = sin(2*pi*phi);
sigVec1 = 12*exp(-(t-0.12).^2/2^2).*sin(2*pi*t);
plot(sig1)
plot(sig2)

%Length of data 
dataLen = timeVec(end)-timeVec(1);
%DFT sample corresponding to Nyquist frequency
kNyq = floor(nSamples/2)+1;
% Positive Fourier frequencies
posFreq = (0:(kNyq-1))*(1/dataLen);
% FFT of signal
fftSig = fft(sigVec);
% Discard negative frequencies
fftSig = fftSig(1:kNyq);

%Plot periodogram
figure;
plot(posFreq,abs(fftSig));
