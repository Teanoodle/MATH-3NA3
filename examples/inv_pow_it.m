function [ln,vn,k] = inv_pow_it(A,tol)
% Usage: [ln,vn,k] = inv_pow_it(A,tol)
%
% Computes smallest eigenpair in magnitude (ln,vn) with tolerance tol by
% inverse iteration using Rayleigh Quotient.
%
% Input:
% A = matrix
% tol = tolerance
%
% Output:
% ln = smallest eigenvalue
% vn = associated eigenvector
% k  = number of iterations

[~,n]=size(A);
[L,U]=gauss_elim(A); % compute LU factorization of A

vn = rand(n,1);      % initialize eigenvector as random vector
error = 1e10;        % initialize error
k = 0; maxit = 1000;
while error > tol && k <= maxit
    y = backsub(U, forsub(L,vn)); % solve Ay = x using LU factorization
    vn = y/norm(y,inf);           % normalize

    ln = (vn'*A*vn)/(vn'*vn);     % compute eigenvalue ln of A corresponding 
                                  % to e-vector vn of inv(A) using Rayleigh Quotient
                                  % (ln,vn is an e-pair of A)

    error = norm(A*vn-ln*vn,inf); % residual error
    k = k+1;
end
if k > maxit
    disp(['Maximum number of iterations reached without achieving tolerance, error = ' sprintf('%0.5g',error)]);
end
