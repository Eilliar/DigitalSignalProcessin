%% Digital Signal Processing - Federal Institute of São Paulo
% Author: Bruno Godoi Eilliar
% LPC Vocoder Assignment
% Notes
% -http://www.data-compression.com/speech.html

clear all
close all
clc

%% Loab/Build Signal
% Get Sample Period
% for fs = 8000 samples/s -> Ts = 1/8000 s
Ts = 1/8000;

% Example
noise = randn(50000,1);
x = filter(1,[1 1/3 1/3 1/4],noise);
x = x(45904:50000);

figure();
plot(x);

%% LPC
% A is the coefficients of the LPC filter H(z)
A = lpc(x, 500);

% Build H(z)
DEN = A;
NUM = 1;
H_z = tf(NUM, DEN, Ts);
H_inv = tf(DEN, NUM, Ts);

[H, W] = freqz([1],A);
figure()
plot(W,abs(H));