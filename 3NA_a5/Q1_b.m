x = [1.02 0.95 0.77 0.67 0.56 0.30 0.16 0.01]';
y = [0.39 0.32 0.22 0.18 0.15 0.12 0.13 0.15]';
N = numel(x);
A = [y.^2, x.*y, x, y, ones(N,1)];
b = x.^2;
tolerances = 10.^(-(1:4));

for tol = tolerances
    disp(['Solving for tolerance = ', num2str(tol)]);
    x_solution = svd_least_squares(A, b, tol);
    disp('Solution:'), disp(x_solution')
end

% Perturbations
xp = [1.2e-03 6.4e-03 -4.8e-03 2.8e-03 -1.4e-03 3.2e-03 3.6e-03 -9.0e-04]';
yp = [-4.8e-03 1.9e-03 3.2e-03 4.8e-03 -2.1e-03 2.4e-03 -5.0e-03 2.2e-03]';

x_pert = x + xp;
y_pert = y + yp;
A_pert = [y_pert.^2, x_pert.*y_pert, x_pert, y_pert, ones(N,1)];
b_pert = x_pert.^2;

for tol = tolerances
    disp(['Solving for tolerance = ', num2str(tol), ' (Perturbed Data)']);
    x_solution = svd_least_squares(A, b, tol);
    disp('Solution:'), disp(x_solution')

    disp(['Solving for tolerance = ', num2str(tol), ' (Perturbed Data)']);
    x_solution_pert = svd_least_squares(A_pert, b_pert, tol);
    disp('Solution (Perturbed):'), disp(x_solution_pert')

    norm_diff= norm(x_solution - x_solution_pert);
    re_norm_diff = norm(x_solution - x_solution_pert)/norm(x_solution);
    disp(['Relative norm difference: ', num2str(re_norm_diff)]);
    disp(['Norm difference: ', num2str(norm_diff)]);

    rel_perturbation = norm([x_pert y_pert] - [x y]) / norm([x y]);
    disp(['Relative perturbation size: ', num2str(rel_perturbation)]);
end



