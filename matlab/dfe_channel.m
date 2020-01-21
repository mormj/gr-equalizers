close all; clear all;

rng(1441352253);
NFFT = 8192;
samp_rate = 1e6;
sym_rate = 1e3;

h = [2.0,-0.459489+-0.156287j,0.185799+0.022878j,0.060229+0.002171j,-0.023041+-0.016539j,-0.004507+0.011984j,-0.002597+0.002675j,0.002320+0.000621j,-0.001420+-0.000126j,-0.000118+-0.000520j,-0.000029+-0.000201j,0.000060+-0.000002j,0.169089+-0.500778j,0.419112+0.042402j,-0.139208+0.030027j,-0.080077+0.036473j,0.026689+0.000837j,-0.002449+0.002320j,-0.000567+-0.002068j,0.001528+0.002867j,0.000944+-0.000166j,0.000218+0.000007j,0.000214+-0.000150j,0.000004+0.000008j];
h = h / norm(h);
[H,W] = freqz(h,1,'whole',NFFT);
H = fftshift(H);
f = samp_rate*[(-NFFT/2):(NFFT/2-1)]/NFFT;
f = f/1000;

figure; plot(f,10*log10(abs(H)));
xlabel('Frequency (kHz)');
ylabel('Channel Response (dB)');
xticks([-500:100:500]);

title(sprintf('Frequency Selective Fading Channel'));