clc;
clear;

fs = 240000;
ts = 1/fs;
F = 10;
T = 1/F;
t = 0:ts:10*T-ts;

x = sin(8*pi*t);

%a
f = 1200;
a = 1;
phic = pi/2;
m = 0.5;

Am = max(abs(x));
x_norm = x/Am;

xc = a*cos(2*pi*f*t + phic);

s = (1 + m*x_norm) .* xc;

%b
figure;
subplot(3,1,1);
plot(t, x, 'LineWidth', 1.5);
title('Tin hieu ban tin');
grid on;

subplot(3,1,2);
plot(t, xc, 'LineWidth', 1.5);
title('Tin hieu song mang');
grid on;

subplot(3,1,3);
plot(t, s, 'LineWidth', 1.5);
title('Tin hieu sau dieu bien');
grid on;
