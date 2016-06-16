function output = my_dft(signal)
% Author: Bruno Godoi Eilliar
% Date: June 16, 2016
% TODO: consider a input step frequency given by the user. For instance, if
% the user wants to analyse the frequency spectrum at each 100 Hz.

% Signal size
n = length(signal);

% Create the Sine/Cosine Matrix
matrix = exp(-2i * pi / n * [0:n-1]' * [0:n-1]);

% Multiply each generated Sine/Cosine by the input signal
if     all(size(signal) == [1 n])  % Row vector
    output = (signal * matrix)/n;
elseif all(size(signal) == [n 1])  % Column vector
    output = (matrix * signal)/n;
end

end

