function x = svd_least_squares1(A, b, k)
% Solve the least squares problem Ax ≈ b using the first k singular values
%
% Inputs:
%   A  - m x n matrix
%   b  - m x 1 right-hand side vector
%   k  - number of singular values to use
%
% Output:
%   x - least squares solution using the specified number of singular values

[U, S, V] = svd(A, 'econ');
k = min(k, size(S, 1));
U_k = U(:, 1:k);
S_k = S(1:k, 1:k);
V_k = V(:, 1:k);

S_k_inv = diag(1 ./ diag(S_k));
A_pinv_k = V_k * S_k_inv * U_k';
x = A_pinv_k * b;
end
