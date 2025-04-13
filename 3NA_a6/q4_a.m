A = [2 4 2; 6 0 8; 3 2 -8];

A_0 = A;

[Q0, R0] = QRfactor(A_0); % QR factorization first time
A_1 = R0 * Q0; % power iteration first time
[Q1, R1] = QRfactor(A_1); % QR factorization second time
A_2 = R1 * Q1; % power iteration second time

disp(A_1)
disp(A_2)

% loglog(error(1:end-1), error(2:end), 'ro-'); grid on;
% xlabel('e_k'); ylabel('e_{k+1}');
% title('Log-Log plot of QR iteration convergence');
