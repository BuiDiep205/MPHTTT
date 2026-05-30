clc; clear;

%a
N_bit = 1000;
bit = randi([0 1], 1, N_bit);
disp(bit);

%b
R = 100e6;
Tb = 1/R;
duty = 0.75;
Ns = 100;
Ns_xung  = round(duty*Ns);

x = zeros(1, Ns*N_bit);

for k = 1:N_bit
    start = (k-1)*Ns + 1;
    stop = k*Ns;
    stop_xung  = start + Ns_xung - 1;
    if bit(k) == 1
        x(start:stop_xung) = 1;
        x(stop_xung+1:stop) = 0;
    else
        x(start:stop) = 0;
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
title('Ma duong RZ 75%');
grid on;

