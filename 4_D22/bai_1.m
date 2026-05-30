clc;
clear;

fs = 1000;
ts = 1/fs;
L = 2000;
t = (0:L-1)*ts;

x = cos(5*pi*t + pi/2) + 10*cos(50*pi*t - pi/2);

%a
figure; 
subplot(2,1,1);
plot(t, x, 'LineWidth', 1.5);
title('Tin hieu mien thoi gian');
xlabel('Thoi gian');
ylabel('Bien do');
grid on;
xlim([0 0.5]);

%b
x_fft = fft(x);
P2 = abs(x_fft/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);

f = fs*(0:L/2)/L;

%c
subplot(2,1,2);
plot(f, P1, 'r', 'LineWidth', 1.5);
grid on;
xlim([0, 40]);
title('Tin hieu trong mien tan so');
xlabel('Tan so');
ylabel('|X(f)|');


