A1 = [0 0 0 2; 1 0 0 -5; 0 1 0 3; 0 0 1 1];
A2 = [1 0 1 0; 1 1 1 0; 0 0 1 0; 1 1 1 1];
power = [10, 100, 1000, 10000];
%% A1 MATRIX
eig1 = eig(A1);
rho1 = max(abs(eig1));
fprintf('True spectral radius of A1 is: %.10f\n', rho1);
for i = 1:length(power)
    k = power(i);
    Ak = A1^k;

    norm1 = norm(Ak, 1);
    norm2 = norm(Ak, 2);
    normInf = norm(Ak, inf);

    fprintf('\nk = %d\n', k);
    fprintf('||A^k||_1^{1/k}    = %.10f\n', norm1^(1/k));
    fprintf('||A^k||_2^{1/k}    = %.10f\n', norm2^(1/k));
    fprintf('||A^k||_inf^{1/k}  = %.10f\n', normInf^(1/k));
end

%% A2 MATRIX
eig2 = eig(A2);
rho2 = max(abs(eig2));
fprintf('True spectral radius of A2 is: %.10f\n', rho2);

for i = 1:length(power)
    k = power(i);
    Ak = A2^k;

    norm1 = norm(Ak, 1);
    norm2 = norm(Ak, 2);
    normInf = norm(Ak, inf);

    fprintf('\nk = %d\n', k);
    fprintf('||A^k||_1^{1/k}    = %.10f\n', norm1^(1/k));
    fprintf('||A^k||_2^{1/k}    = %.10f\n', norm2^(1/k));
    fprintf('||A^k||_inf^{1/k}  = %.10f\n', normInf^(1/k));
end
