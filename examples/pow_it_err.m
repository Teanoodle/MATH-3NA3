function [l1,v1,k,error] = pow_it_err(A,tol)
% Usage: [l1,v1,k,error] = pow_it_err(A,tol)
% Computes largest eigenpair (l1,v1) with iteration tolerance tol by
% power iteration. Provides error at each iteration.
% Input:
% A = matrix
% tol = tolerance
% Output:
% l1    = largest eigenvalue
% v1    = associated eigenvector
% k     = number of iterations
% error = error at each iteration

[n,~]=size(A);
v1 = rand(n,1); % initialize eigenvector
l1 = (v1'*A*v1)/(v1'*v1);
error(1) = norm(A*v1-l1*v1,inf);       % initialize error

k = 1; maxit = 1000;
while error(k) > tol && k <= maxit
      y = A*v1;
      v1 = y/norm(y,inf);              % normalize
      l1 = (v1'*A*v1)/(v1'*v1);        % compute eigenvalue using Rayleigh quotient 
      k = k+1;
      error(k) = norm(A*v1-l1*v1,inf); % residual error
end
k = k-1;
if k > maxit
    disp(['Maximum number of iterations reached without achieving tolerance, error = ' sprintf('%0.5g',error)]);
end
