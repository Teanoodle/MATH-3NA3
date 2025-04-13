A = [6 -3 2; -3 5 -7; 2 -7 14];
b = [6; -4; 6];
x = A \ b;
disp(x)

rng('default');
rd_b = 2 * rand(size(b)) - 1; % random number between -1 and 1
delta_b = 0.1 * rd_b / norm(rd_b, inf); % ||Δb||_∞ = 0.1
b1 = b + delta_b;
x1 = A \ b1;
delta_x = x1 - x;
disp(delta_x)

forward_error = norm(delta_x) / norm(x); % ||Δx|| / ||x||
backward_error = norm(delta_b) / norm(b); % ||Δb|| / ||b||
k = cond(A);

fprintf('cond(A) = %.4f\n', k);
fprintf('||Δx|| / ||x|| = %.6f\n', forward_error);
fprintf('||Δb|| / ||b|| = %.6f\n', backward_error);
fprintf('cond(A) * (||Δb|| / ||b||) = %.6f\n', k * backward_error);

if forward_error <= k * backward_error
    fprintf('inequality holds');
else
    fprintf('inequality not holds');
end
