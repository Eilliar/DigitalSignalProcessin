%% Digital Signal Processing - Federal Institute of São Paulo
% Author: Bruno Godoi Eilliar
% Notes:

clear all
close all
clc

%% Variables
fa = 25e3;                          % Hz
Ta = 1/fa;                          % 1/Hz
n = 10000;                          % number of sampes
t = (0 : Ta : n*Ta - Ta);           % Time vector

%% Sinewaves
% 100 Hz
sin100 = 2*sin(2*pi*100*t);

% 1200 Hz
sin1k2 = 0.5*sin(2*pi*1200*t);

% 5000 Hz
sin5k = 0.5*sin(2*pi*5000*t);

%% Plot
figure(1);
subplot(3,1,1);
plot(t, sin100);
title('Sinewave 100 Hz');

subplot(3,1,2);
plot(t, sin1k2, 'r');
title('Sinewave 1200 Hz');

subplot(3,1,3);
plot(t, sin5k, 'm');
title('Sinewave 5000 Hz');
xlabel('time (s)');

figure(2);
plot(t, sin100+sin1k2+sin5k);
title('Sum of all sinewaves');
xlabel('time (s)');