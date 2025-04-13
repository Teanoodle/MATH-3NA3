function [A,V,k] = qr_it(A,tol,kmax)
% Usage: [A,V,k] = qr_it(A,tol,kmax)
% Computes all eigenpairs with iteration tolerance tol by QR iteration.
%
% The error criterion compares convergence to the Schur form for every
% other iteration since for matrices with non-distinct eigenvalues the
% Schur form can alternate between two equivalent forms (different blocks
% with the same eigenvalues).
%
% Input:
% A = matrix
% tol = tolerance
% kmax = max allowable number of iterations
%
% Output:
% A = matrix reduced to Schur form (block upper triangular in general)
% V = matrix of associated eigenvectors or Schur vectors
% k = number of iterations

[~,n]=size(A);
V = eye(n);
k = 1;
err = norm(A);
while err>tol && k<=kmax
    if mod(k+1,2)==0
        A_old = A;
    end

    [Q,R] = qr(A); % compute QR factorization
    A = R*Q;       % generate next matrix
    V = V*Q;       % update product of unitary transforms

    if mod(k,2)==0
        err = norm(A-A_old)/norm(A);
    end
    k = k+1;
end
if k>kmax
    fprintf('WARNING: QR iterations not converged\n');
end
A(abs(A)<tol*norm(A))=0; % set sub lower triangular entries to zeros
