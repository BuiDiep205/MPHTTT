clear; clc;
% a
N_bits = 5000; 
bit_stream = randi([0 1], 1, N_bits);

% b.
M = 16;             % 16-PSK
k = log2(M);        % 4 bit/ký hiệu
SNR_dB = 5;         % SNR = 5dB

% Gom bit thành ký hiệu số
bit_matrix = reshape(bit_stream, k, [])';
symbols = bi2de(bit_matrix, 'left-msb'); 

% Điều chế 16-PSK và truyền qua kênh AWGN
tx_signal = pskmod(symbols, M, 0, 'gray');
rx_signal = awgn(tx_signal, SNR_dB, 'measured');

% Giải điều chế tại phía thu
rx_symbols = pskdemod(rx_signal, M, 0, 'gray');
rx_bit_matrix = de2bi(rx_symbols, k, 'left-msb');
rx_bit_stream = reshape(rx_bit_matrix', 1, []);

% c. Vẽ giản đồ chòm sao
figure;
subplot(1,2,1); 
plot(tx_signal, 'ro'); 
grid on;
title('Chòm sao TRƯỚC kênh');

subplot(1,2,2); 
plot(rx_signal, 'b.');
grid on;
title('Chòm sao SAU kênh');

% d. Tính số lỗi bit
[num_errors, ber] = biterr(bit_stream, rx_bit_stream);
disp(['Số bit lỗi: ', num2str(num_errors)]);
disp(['Tỷ lệ lỗi BER: ', num2str(ber)]);
