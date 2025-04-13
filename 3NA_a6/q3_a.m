A = [6 2 1; 2 3 1; 3 1 -1];

x_0 = eye(3); % first guess 3 by 3 identity matrix

[Q0, R0] = QRfactor(x_0); % QR factorization first time
x_1 = A *Q0; % power iteration of col A
[Q1, R1] = QRfactor(x_1); % % QR factorization second time

% disp(x_1);
disp(Q0);
disp(Q1)

