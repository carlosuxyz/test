n = 0:319;
x = 5*cos(pi/4*n) + 2*cos(pi/3*n); %+ randn(size(n));
plot(x);

pxx_pwelch = pwelch(x);
[w,pxx_periodogram] = periodogram(x);

subplot(2,1,1)
plot(10*log10(pxx_pwelch));
subplot(2,1,2)
plot(w,10*log10(pxx_periodogram))

periodogram(x);