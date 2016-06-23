%% Digital Signal Processing - Federal Institute of São Paulo
% Author: Bruno Godoi Eilliar
% Digital Filter Design Assignment
% Notes:

%% Build the signal
% Signals:
% * sin100 - 100 Hz sinewave
% * sin1k2 - 1200 Hz sinewave
% * sin5k - 5000 Hz sinewave
% * sum_sin - sum of all sinewave
Assignment01;

%% Digital Low Pass Filter Design
% From Assignment 1 we have Sampling Frequency: fa = 25e3

Rp  = .1;
Rs = 40;
% Normalized Frequencies
Wp = 100/(fa/2);    %Pass Band
Ws = 200/(fa/2);    %Stop Band -> Try to change 200 to 150! 
filtertype = 'low';

% Chebyshev Type I
% Compute the minimum filter order n
[n,Wn] = cheb1ord(Wp,Ws,Rp,Rs);
[b, a] = cheby1(n,Rp,Wn, filtertype);
fvtool(b, a);

% Chebyshev Type II
% Compute the minimum filter order n
[n2, Wn2] = cheb2ord(Wp, Ws, Rp, Rs);
[b2, a2] = cheby2(n2,Rs,Wn2);


%% PLot
filtered_signal_1 = filter(b, a, sum_sin);
filtered_signal_2 = filter(b2, a2, sum_sin);

figure();
subplot(3,1,1); grid on;
plot(t, sum_sin);
ylim([-5 5]);
title('Signal');

subplot(3,1,2); grid on;
plot(t, filtered_signal_1, 'r');
ylim([-5 5]);
title('Chebyshev Type I - Low Pass Filter');

subplot(3,1,3); grid on;
plot(t, filtered_signal_2, 'm');
ylim([-5 5]);
title('Chebyshev Type II - Low Pass Filter');
xlabel('Time (s)');