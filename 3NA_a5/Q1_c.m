x = [1.02 0.95 0.77 0.67 0.56 0.30 0.16 0.01]';
y = [0.39 0.32 0.22 0.18 0.15 0.12 0.13 0.15]';
N = numel(x);
A = [y.^2, x.*y, x, y, ones(N,1)];
b = x.^2;


xp = [1.2e-03 6.4e-03 -4.8e-03 2.8e-03 -1.4e-03 3.2e-03 3.6e-03 -9.0e-04]';
yp = [-4.8e-03 1.9e-03 3.2e-03 4.8e-03 -2.1e-03 2.4e-03 -5.0e-03 2.2e-03]';

x_pert = x + xp;
y_pert = y + yp;
A_pert = [y_pert.^2, x_pert.*y_pert, x_pert, y_pert, ones(N,1)];
b_pert = x_pert.^2;

% Define k-values (number of singular values to use)
k_val = 1:5;
norm_diffs = zeros(length(k_val), 1);
fit_errors = zeros(length(k_val), 1);

for i = 1:length(k_val)
    k = k_val(i);

    x_solution = svd_least_squares1(A, b, k);
    x_solution_pert = svd_least_squares1(A_pert, b_pert, k);
    
    norm_diffs(i) = norm(x_solution - x_solution_pert);
    norm_re_diffs(i) = norm(x_solution - x_solution_pert)/norm(x_solution);
    fit_errors(i) = norm(A * x_solution - b);

    fprintf('Using first %d singular values:\n', k);
    fprintf('Solution (Unperturbed): ');
    fprintf('%.6f ', x_solution);
    fprintf('\nSolution (Perturbed): ');
    fprintf('%.6f ', x_solution_pert);
    fprintf('\nNorm difference: %.6f\n', norm_diffs(i));
    fprintf('\nRelative change in parameters: %.6f\n', norm_re_diffs(i));
    fprintf('Fit error: %.6f\n\n', fit_errors(i));
end