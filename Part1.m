close
clear all
clc
%%Question 01 - Fourier Series 
t=-2*pi:0.01:2*pi; % Time period I chose to plot the signal on
%Two Embedded for loops to calculate each value of the signals
for i=1:length(t)
    x1(i)=0;
    for k=-100:100
        x1(i)=x1(i)+j*k*exp(-abs(k))*exp(j*k*2*pi*t(i)/50);
    end
    x2(i)=0;
    for k=-100:100
        x2(i)=x2(i)+abs(sin(k*pi/2))*exp(j*k*2*pi*t(i)/50);
    end
end
%Figure 1 - Subplot of the real parts of both signals
figure;
hold on % In order to plot more than one signal
subplot(1,2,1) % 1 by 2 array - position 1
plot(t,real(x1)); % Real part of x(t)
title('Real part plot');
legend('x1(t)');
xlabel('Time')
subplot(1,2,2) % Subplot 2
plot(t,real(x2)); % Plot real part of x2(t)
title('Real part plot');
legend('x2(t)');
xlabel('Time')
hold off
%Figure 2 - Subplot of the Imaginary parts of both signals
figure;
%Another 1 by 2 array of subplots
subplot(1,2,1)
plot(t,imag(x1)); %Imaginary part of x(t)
title('Imaginary part plot');
legend('x1(t)');
xlabel('Time')
subplot(1,2,2)
plot(t,imag(x2)); %Imaginary plot of x2(t)
title('Imaginary part plot');
legend('x2(t)');
xlabel('Time')