close
clear all
clc
filename = 'Pianokey.wav';
[y,Fs] = audioread(filename);%Used just to get the sampling frequency
samples = [1.59*Fs,1.82*Fs]; %Cutting the Signal using the Fs
[y,Fs] = audioread(filename, samples); %Reading the cut signal
sound(y,Fs);
x = fft(y); %DFT
T = 1/Fs; % sampling period
L = length(y); % signal length
t = (-(L/2):(L-1)/2)*T; % time vector considered
figure;
plot(t*Fs,real(x)) %Scaling the x axis, plotting the real plot
title('DFT - Real Part')
xlabel('Time')
ylabel('Amplitude')
figure
plot(t*Fs,imag(x)) %Scaling the x axis, plotting the imaginary plot
title('DFT - Imaginary Part')
xlabel('Time')
ylabel('Amplitude')
x = fft(y); %Plotting the values of the signal
figure;
plot(y, 'b-');
title('Signal in Time')
grid on
figure; 
T = 1/Fs; % sampling period
L = length(y); % signal length
t = (0:L-1)*T; % time vector considered
Y = x;
f = Fs*(0:(L/2))/L; %Scaling the X axis to maintain a correct frequency value using size of the signal
P2 = abs(Y/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);%Plotting the frquency spectrum
plot(f,P1); %Scaled x axis against the frequency spectrum
xlim([0 1000]) %Limiting the plot for clarity's sake
title('Amplitude Spectrum of S(t)')
xlabel('f (Hz)')
ylabel('|P1(f)|')
grid on