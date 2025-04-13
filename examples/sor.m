function [x,iter,error] = sor(A,b,omega,tol,maxiter)
% Usage: [x,iter,error] = sor(A,b,omega,tol,maxiter)
% Uses Jacobi iteration to solve Ax = b
% Input variables:
% A = matrix
% b = rhs
% omega = relaxation parameter
% tol = l2 tolerance on residue
% maxiter = maximum allowable number of iterations
% Output variables:
% x = solution
% iter = number of iterations 
% error = error achieved (measured by relative residual)

[n,~] = size(A); % Find size of matrix

x = 0*b; % Initial guess
k = 0; % Initialize iteration counter
error = norm(A*x-b); % Initial error

while error > tol && k <= maxiter
    k = k+1;
    for i = 1:n
        x(i) = (1-omega)*x(i) + ...                % old value
        omega * (b(i) - A(i,1:i-1)*x(1:i-1) - ...  % Gauss-Seidel
        A(i,i+1:n)*x(i+1:n))/A(i,i);
    end
    error = norm(A*x-b)/norm(b); % relative residual error
end
iter = k;