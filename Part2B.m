close
clear all
clc
%% PART 1
Fs = 2000; %sampling frequency - This value was adjusted to see the signal
% better
T = 1/Fs; % sampling period
L = 1000; % signal length
t = (0:L-1)*T; % time vector considered
%defining properties of the signal and plotting the signal s in time domain
A1 = 10; A2 = 3; %Given Values
f1 = 10; f2 = 40;% Given Values
s = A1*cos(2*pi*f1*t) + A2*sin(2*pi*f2*t); %Equation of x(t)
figure; %Figure 1 - Defining the signal and plotting it
plot(t,s);
xlabel('t')
ylabel('s(t)')
title('s(t) = A1*cos(2*pi*f1*t) + A2*sin(2*pi*f2*t)')
grid on


%% PART 2
% % DFT of s using matlab built-in function fft
Fs = 180; %This value was adjusted to clearly see the waveform
T = 1/Fs; % sampling period
L = 1000; % signal length
t = (0:L-1)*T; % time vector considere
s = A1*cos(2*pi*f1*t) + A2*sin(2*pi*f2*t);
S = fft(s); % DFT of s
figure;
%2 by 1 plot
subplot(2,1,1);
plot(t*Fs,real(S)); % Real part of the Dft of s
title('Real part of DFT(s)')
xlabel('f (Hz)')
ylabel('Amplitude')
subplot(2,1,2); % Imaginary part of the Dft of S
plot(t*Fs,imag(S));
title('Imaginary Part of DFT(s)')
xlabel('f (Hz)')
ylabel('Amplitude')


Fs = 2000; %sampling frequency - This value was adjusted to see the signal
% better
T = 1/Fs; % sampling period
L = 1000; % signal length
t = (0:L-1)*T; % time vector considere
s = A1*cos(2*pi*f1*t) + A2*sin(2*pi*f2*t);
S = fft(s); % DFT of s
negative_positive_spectrum = (2*abs([S(L/2+2:end) S(1:L/2+1)]))/L;
f=Fs/2*linspace(-1,1,L);
figure;
plot(f,negative_positive_spectrum)
title('single-sided amplitude spectrum of s(t) with f1 and f2')
xlabel('f (Hz)')
ylabel('Amplitude')
xlim([-50 50])


%PART 3
%removing the f2 component and plotting the rest of the spectrum
G =  fft(A1*cos(2*pi*f1*t)) % Sine(0) = 0 - Ignore the other half
figure
plot(f,(2*abs([G(L/2+2:end) G(1:L/2+1)]))/L);
%Two sided frequency spectrum
title('single-sided amplitude spectrum of s(t) with f2 removed')
xlabel('f (Hz)')
ylabel('Amplitude')
xlim([-20 20]) % Better Visibility
grid on

%PART 4
% obtaining g(t) using matlab built-in function ifft and plotting in time domain
figure
g = ifft(G);
plot(f,g);
xlabel('t')
ylabel('g(t)')
grid on
title('g(t) vs t')