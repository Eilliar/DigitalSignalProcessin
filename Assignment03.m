%% Digital Signal Processing - Federal Institute of São Paulo
% Author: Bruno Godoi Eilliar
% Notes:

%% Build the signal
% Signals:
% * sin100 - 100 Hz sinewave
% * sin1k2 - 1200 Hz sinewave
% * sin5k - 5000 Hz sinewave
% * sum_sin - sum of all sinewave
Assignment01;

%% Perofmt My DFT

%% Perform Matlab FFT

f = fa*(0:(n/2))/n;                 % frequency vector
FFT_SIN = fft(sum_sin);
P2 = abs(FFT_SIN/n);
P1 = P2(1:n/2 + 1);                 % first half of power spectrum
P1(2:end-1) = 2*P1(2:end-1);

%% Plot Matlab FFT
figure;
plot(f, P1);
title('Single-Sided Amplitude Spectrum of X(t)')
xlabel('f (Hz)')
ylabel('|P1(f)|')