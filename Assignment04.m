%% 

clear all
close all
clc

%% Loab/Build Signal

% Example
noise = randn(50000,1);
x = filter(1,[1 1/3 1/3 1/4],noise);
x = x(45904:50000);

figure();
plot(x);

%% LPC
% a is the coefficients of the filter H(z)
a = lpc(x,3);

% Build H(z)
DEN = a;
NUM = 1;
H_z = tf(