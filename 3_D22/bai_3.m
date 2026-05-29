clc; clear;

fs = 100000;
ts = 1/fs;
t = 0:ts:1-ts;
x = cos(40*pi*t - pi) + 3*cos(30*pi*t);

%a
fc = 10000;
kp = pi/2;

y = cos(2*pi*fc*t + kp*x);

%b
Pn = 2;
noise = sqrt(Pn) * randn(size(y));
y_noise = y + noise;

%c
x_rec = pmdemod(y_noise, fc, fs, kp);

% d. Ve
figure;

subplot(3, 1, 1);
plot(t, x, 'LineWidth', 1.5);
grid on;
xlabel('Thoi gian t(s)');
ylabel('Bien do x(t)');
title('Tin hieu ban tin');
xlim([0 0.2]);

subplot(3, 1, 2);
plot(t, y, 'LineWidth', 1.5);
grid on;
xlabel('Thoi gian t(s)');
ylabel('Bien do y(t)');
title('Tin hieu dieu che pha PM');
xlim([0 0.002]);

subplot(3, 1, 3);
plot(t, x_rec, 'LineWidth', 1.5);
grid on;
xlabel('Thoi gian t(s)');
ylabel('Bien do x rec(t)');
title('Tin hieu sau khi giai dieu che');
xlim([0 0.2]);

