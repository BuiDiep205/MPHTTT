clc; clear;

fs = 100e3;
ts = 1/fs;
t = 0:ts:1-ts;
x = cos(40*pi*t - pi) + 3*cos(30*pi*t);

%a
fc = 10000;
kp = pi/4;

s = cos(2*pi*fc*t + kp*x);

%b
Pn = 2;
noise = sqrt(Pn) * randn(size(s));
s_noise = s + noise;

%c
x_rec = pmdemod(s_noise, fc, fs, kp);


% d. Ve
figure;
subplot(3,1,1);
plot(t,x, 'LineWidth', 1.5);
grid on;
xlabel('Thoi gian');
ylabel('Bien do');
title('Tin hieu ban tin');

subplot(3,1,2);
plot(t, s_noise);
grid on;
xlabel('Thoi gian');
ylabel('Bien do');
title('Tin hieu dieu che qua kenh AWGN');

subplot(3,1,3);
plot(t, x_rec, 'LineWidth', 1.5);
grid on;
xlabel('Thoi gian');
ylabel('Bien do');
title('Tin hieu sau giai dieu che');

