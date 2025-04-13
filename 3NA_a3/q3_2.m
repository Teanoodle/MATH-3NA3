A = [3 -2 0 0 0; -2 5 1 0 0; 0 1 4 -2 0; 0 0 -2 5 1; 0 0 0 1 2];
b = [5; -9; 0; 3; 0];
tol = [1e-2, 1e-4, 1e-6, 1e-8];
maxiter = 1000;

% find the optimal w
D= diag(diag(A));
L=tril(A,-1);
U = triu(A,1);
G_jac = -inv(D)*(L+U);
rho = max(abs(eig(G_jac)));
omega = 2/(1+sqrt(1-rho^2));
disp(omega)


fprintf('SOR Method:\n');
for i = tol
    [x_sor, iter_sor, error_sor] = sor(A, b, omega, i, maxiter);
    fprintf('Tolerance: %e, Iterations: %d, Error: %e, \n', i, iter_sor, error_sor);
    disp('Solution:');
    disp(x_sor);
end