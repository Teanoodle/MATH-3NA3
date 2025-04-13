A = [3 -2 0 0 0; -2 5 1 0 0; 0 1 4 -2 0; 0 0 -2 5 1; 0 0 0 1 2];
b = [5; -9; 0; 3; 0];
tol = [1e-2, 1e-4, 1e-6, 1e-8];
maxiter = 1000;


fprintf('Jacobi Method:\n');
for i = tol
    [x_j, iter_j, error_j] = jacobi(A, b, i, maxiter);
    fprintf('Tolerance: %e, Iterations: %d, Error: %e, \n', i, iter_j, error_j);
    disp('Solution:');
    disp(x_j);
end


fprintf('G-S Method:\n');
for i = tol
    [x_gs, iter_gs, error_gs] = G_S(A, b, i, maxiter);
    fprintf('Tolerance: %e, Iterations: %d, Error: %e  \n', i, iter_gs, error_gs);
    disp('Solution:');
    disp(x_gs);
end
