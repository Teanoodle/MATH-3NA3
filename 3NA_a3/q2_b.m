A = [4 3 2; 0 5 -2; -1 -2 7];

p1 = 1;
p2 = 2;
p3 = inf;

lambda_1 = matrix_norm(A, p1);
lambda_2 = matrix_norm(A, p2);
lambda_inf = matrix_norm(A, p3);

fprintf('norm_1: %f\n', lambda_1);
fprintf('norm_2: %f\n', lambda_2);
fprintf('norm_inf: %f\n', lambda_inf);

% Continue compute spectral radius
D = diag(diag(A));
L = tril(A,-1);
U = triu(A,1);
G_jac = -inv(D)*(L+U);
rho = max(abs(eig(G_jac)));
disp(rho)
