function [x, iter, error] = jacobi4(A, b, x0, tol, maxiter)
% Usage: [x, iter, error] = jacobi(A, b, x0, tol, maxiter)
% Jacobi iteration to solve Ax = b with an initial guess x0
%
% Input variables:
% A = matrix
% b = rhs
% x0 = initial guess
% tol = l2 tolerance on relative residual error
% maxiter = maximum allowable number of iterations
%
% Output variables:
% x = solution
% iter = number of iterations
% error = error achieved (measured by relative residual)


[n, ~] = size(A); % % Find size of matrix

x = x0; % Use provided initial guess
k = 0; % Initialize iteration counter
error = norm(A*x - b, 2); % Initial relative error
y = zeros(n, 1);

while error > tol && k < maxiter
    k = k + 1;
    for i = 1:n
        y(i) = (b(i) - A(i, 1:i-1) * x(1:i-1) - A(i, i+1:n) * x(i+1:n)) / A(i, i);
    end
    x = y;
    error = norm(A*x - b, 2) / norm(b, 2);
end

iter = k;
end
