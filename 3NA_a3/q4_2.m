A = [1 0 1; -1 1 0; 1 2 -3];
b = [2; 0; 0];

% Find the exact value
x_exact = A\b;
fprintf('exact value is: \n');
disp(x_exact)

tol = 1e-8;
maxiter = 800;

% initial guesses as input
initial_guesses = {
    'If x=[1,1,1]', x_exact;
    'If x=[1.1,1.1,1.1]', x_exact + 0.1; 
    'If x=[2,2,2]', [2; 2; 2]
};


for i = 1:size(initial_guesses,1)
    label = initial_guesses{i,1}; % for output label
    x0 = initial_guesses{i,2};
    
    [x_j, iter_j, error_j] = jacobi4(A, b, x0, tol, maxiter);
    [x_gs, iter_gs, error_gs] = G_S4(A, b, x0, tol, maxiter);


fprintf('\n   %s:  \n', label);
    fprintf('  Jacobi: %d iterations, Final Error = %e    \n', iter_j, error_j(end));
    disp('Solution:');
    disp(x_j);
    fprintf('  Gauss-Seidel: %d iterations, Final Error = %e    \n', iter_gs, error_gs(end));
    disp('Solution:');
    disp(x_gs);
end

