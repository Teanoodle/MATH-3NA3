function [x,iter,error] = gaussseidel(A,b,tol,maxiter)
% Usage: [x,iter,error] = gaussseidel(A,b,tol,maxiter)
% Uses Gauss-Seidel iteration to solve Ax = b
%
% Input variables:
% A = matrix
% b = rhs
% tol = l2 tolerance on relative residual error
% maxiter = maximum allowable number of iterations
%
% Output variables:
% x = solution
% iter = number of iterations 
% error = error achieved (measured by relative residual)

[n,~] = size(A); % Find size of matrix

x = 0*b; % Initial guess
k = 0; % Initialize iteration counter
error = norm(A*x-b,2); % Initial error

while error > tol && k <= maxiter
    k = k+1;
    for i = 1:n
        x(i) = (b(i) - A(i,1:i-1)*x(1:i-1) - ... % Use new values of x
            A(i,i+1:n)*x(i+1:n))/A(i,i);
    end
    error = norm(A*x-b)/norm(b); % relative residual error 
end
iter = k;