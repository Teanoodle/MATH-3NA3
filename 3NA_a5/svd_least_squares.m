function x = svd_least_squares(A, b, tolerances)
% Solve the least squares problem Ax ≈ b using SVD
%
% Inputs:
%   A   - m x n matrix
%   b   - m x 1 right-hand side vector
%   tolerances - array of tolerances for determining the numerical rank of A
%
% Output:
%   x   - least squares solution for the smallest tolerance

[U, S, V] = svd(A, 'econ');

% Singular values from the diagonal of S
sigma = diag(S);

% Initialize table data
results = zeros(length(tolerances), 2);

for i = 1:length(tolerances)
    tol = tolerances(i);
    r = sum(sigma > tol * max(sigma));
    S_inv = diag(1 ./ sigma(1:r)); % Invert only nonzero singular values
    A_pinv = V(:, 1:r) * S_inv * U(:, 1:r)';

    % Compute the least squares solution
    x = A_pinv * b;

    % Store results
    results(i, :) = [tol, r];

    fprintf('Solution for tolerance = %.6f:', tol);
    fprintf('%.6f ', x);
    fprintf('\n');
end
disp('Tolerance vs. Rank of A:');
disp(array2table(results, 'VariableNames', {'Tolerance', 'Rank'}));
x = A_pinv * b;
end