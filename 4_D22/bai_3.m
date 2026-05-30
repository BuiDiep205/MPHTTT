clc; clear;

fs = 100e3;
ts = 1/fs;
t = 0:ts:1-ts;

x = cos(5*pi*t + pi/2) + 10*cos(50*pi*t - pi/2);

%a
fc = 10e3;
phic = pi/4;
xc = cos(2*pi*fc*t + phic);

s = x .* xc;

%b
Pn = 3;
noise = sqrt(Pn) * randn(size(s));
s_noise = s + noise;

%c
x_rec = amdemod(s_noise, fc, fs, phic, 0);
x_rec = movmean(x_rec, 500);

%d
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
