clc; clear;
%a
N_bits = 10000;
bit_stream = randi([0, 1], 1, N_bits);

%b
M = 4;
k = log2(M);
SNR_dB = 10;

bit_matrix = reshape(bit_stream, k, [])';
symbols = bi2de(bit_matrix, 'left-msb');

% Điều chế 4-QAM và truyền qua kênh AWGN
tx_signal = qammod(symbols, M, 'UnitAveragePower', true);
rx_signal = awgn(tx_signal, SNR_dB, 'measured');

% Giải điều chế tại phía thu
rz_symbols = qamdemod(rx_signal, M, 'UnitAveragePower', true);
rx_bit_matrix = de2bi(rz_symbols, k, 'left-msb');
rx_bit_stream = reshape(rx_bit_matrix, 1, []);

%c
figure;
subplot(1,2,1);
plot(tx_signal, 'ro');
title('Chom sao truoc kenh');
grid on;

subplot(1,2,2);
plot(rx_signal, 'b.');
title('Chom sao sau kenh');
grid on;

%d
[num_errors, ber] = biterr(bit_stream, rx_bit_stream);
disp(['So bit loi: ', num2str(num_errors)]);
disp(['Ti le loi BER; ', num2str(ber)]);
