A = [6 -3 2; -3 5 -7; 2 -7 14];
b = [6; -4; 6];
x = A \ b;
disp(x)

rng('default');
rd_A = 2 * rand(size(A)) - 1; % random number between -1 and 1
delta_A = 0.1 * rd_A / norm(rd_A, inf); % ||ΔA||_∞ = 0.1
A1 = A + delta_A;
x_hat = A1 \ b;
disp(x_hat)
delta_x = x_hat - x;

forward_error = norm(delta_x) / norm(x); % ||Δx|| / ||x||
error_A = norm(delta_A) / norm(A); % ||ΔA|| / ||A||
k = cond(A);

fprintf('cond(A) = %.4f\n', k);
fprintf('||Δx|| / ||x|| = %.6f\n', forward_error);
fprintf('||ΔA|| / ||A|| = %.6f\n', error_A);
fprintf('cond(A) * ||ΔA|| / ||A|| = %.6f\n', k * error_A);

if forward_error <= k * error_A
    fprintf('inequality holds');
else
    fprintf('inequality not holds');
end
