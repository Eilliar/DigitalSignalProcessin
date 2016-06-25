%% Digital Signal Processing - Federal Institute of São Paulo
% Author: Bruno Godoi Eilliar
% LPC Vocoder Assignment
% Notes
% -http://www.data-compression.com/speech.html

clear all
close all
clc
%% Loab/Build Signal
filename = 'meu_mono_A.wav';
[x, Fs] = audioread(filename);
x = x(end/8:end/4);
% Get Sample Period
% for fs = 44100 samples/s -> Ts = 1/44100 s
Ts = 1/Fs;
% UI information
disp('Audio sucessfully loaded.');

figure();
plot(x); grid on;
title('Mono "A" Vowel Sound');
sound(x, Fs);
disp('Press ENTER key to continue...');
pause;

%% LPC
disp('Proceeding to LPC Vocoder Algorithm');
% A is the coefficients of the LPC filter H(z)
A = lpc(x, 5);

% Build H(z)
DEN = A;
NUM = 1;
H_z = tf(NUM, DEN, Ts);
% Build the inverse of H(z)
H_inv = tf(DEN, NUM, Ts);

% Check frequency response of the digital filter H(z)
[H, W] = freqz([1],DEN);
figure()
W_norm = W*Fs/(2*pi);
plot(W_norm,abs(H)); grid on;
title('H(z) - Frequency response');

% Check frequency response of the digital filter H_inv(z)
[H_i, W_i] = freqz(DEN, [1]);
W_norm = W_i*Fs/(2*pi);
figure()
plot(W_norm,abs(H_i)); grid on;
title('H_inv(z) - Frequency response');

%% Vocoder
inverse_signal = filter(1, A, x);
figure()
plot(inverse_signal(1:end/8));
title('inverse signal');

% Use My DFT to find the frequency of inverse_signal
n = length(inverse_signal);
FFT_SIN = fft(inverse_signal);
P2 = abs(FFT_SIN/n);
P1 = P2(1:n/2 + 1);                 % first half of power spectrum

% Frequency vector
f = Fs*(0:(n/2))/n;

figure;
plot(f, P1);
title('My DFT');
xlabel('Frequency (Hz)');
ylabel('|DFT(x)|');

%% Impulse train
f = 794; %frequency of the impulse in Hz
fs = f*10;
t = 0:1/fs:length(x); % time vector
y=zeros(size(t));
y(1:fs/f:end)=1;
figure();
plot(t(1:500),y(1:500));

%% Reconstruction

rec = filter(1,A, y);
figure()
subplot(2,1,1);
plot(t(1:5000), rec(1:5000));
subplot(2,1,2);
plot(x(1:5000));