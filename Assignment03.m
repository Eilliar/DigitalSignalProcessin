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

%% Perform My DFT
% Like the matlab FFT, it will return a complex vector. The absolute plot will be
% symetric.
DFT_SIN = my_dft(sum_sin);
DFT_P1 = abs(DFT_SIN(1:length(DFT_SIN)/2 + 1));

% Frequency vector
f = fa*(0:(n/2))/n;

figure;
plot(f, DFT_P1);
title('My DFT');
xlabel('Frequency (Hz)');
ylabel('|DFT(x)|');
%% Perform Matlab FFT

FFT_SIN = fft(sum_sin);
P2 = abs(FFT_SIN/n);
P1 = P2(1:n/2 + 1);                 % first half of power spectrum

%% Plot Matlab FFT
figure;
plot(f, P1);
title('Single-Sided Amplitude Spectrum of X(t)')
xlabel('f (Hz)')
ylabel('|FFT(x)|')