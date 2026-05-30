clc; clear;

%a
N_bits = 50;
bit = randi([0, 1], 1, N_bits);
disp(bit);

%b
R = 500e6;
Tb = 1/R;

Ns = 1000;
ts = Tb/Ns;

x = [];
muc_1 = -1;
for k = 1:N_bits
    if bit(k) == 0
        x = [x, -1*ones(1,Ns/2), 1*ones(1,Ns/2)];
    else
        x = [x, muc_1*ones(1, Ns)];
        muc_1 = -muc_1;
    end
end 

%c
N_ve = 10;
K_mau = N_ve * Ns;
t = (0:K_mau-1)*(Tb/Ns);

figure;
plot(t*1e9, x(1:K_mau), 'LineWidth', 1.5);
xlabel('Thoi gian');
ylabel('Bien do');
title('Ma duong CMI');
grid on;

