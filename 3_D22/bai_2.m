clc; clear;

%a
N_bits = 50;
bit_stream = randi([0, 1], 1, N_bits);
disp(bit_stream);

%b
R = 500e6;
Tb = 1/R;

Ns = 1000;
ts = Tb/Ns;

x = [];
muc_1 = -1;
for k = 1:N_bits
    if bit_stream(k) == 0
        x = [x, -1*ones(1,Ns/2), 1*ones(1,Ns/2)];
    else
        x = [x, muc_1*ones(1, Ns)];
        muc_1 = -muc_1;
    end
end 

%c
N_ve  = 10;
M_ve = N_ve * Ns;
t = 0:ts:ts*M_ve - ts;

figure;
plot(t*1e9, x(1:M_ve), 'LineWidth', 1.5);
grid on;
title('Bieu do dang song tin hieu');
xlabel('Thoi gian');
ylabel('Bien do');
xlim([0, N_ve*Tb*1e9]);
ylim([-1.5, 1.5]);
