function [A,V,k] = qr_shift_ex(A,tol,kmax)
% Usage: [A,V,k] = qr_shift_ex(A,tol,kmax)
% Computes all eigenpairs by QR iteration with shifts and deflation
%
% Input:
% A    = matrix
% tol  = tolerance
% kmax = max allowable number of iterations
%
% Output:
% A = upper triangular matrix containing eigenvalues
% V = matrix of associated eigenvectors (or Schur vectors)
% k = number of iterations

k = 1;
[~,n]=size(A);
V = eye(n);
m = n;
while m ~= 0
    [Q,R] = qr(A(1:m,1:m)-A(m,m)*eye(m));     % compute QR factorization of shifted matrix
    A(1:m,1:m) = R*Q + A(m,m)*eye(m);         % generate next matrix from QR and unshift
    Qn = eye(n); Qn(1:m,1:m) = Q;             % form nxn Q matrix
    V = V*Qn;                                 % update product of unitary transforms

    if norm(A(m,1:m-1)) < tol*norm(A)         % restrict to leading submatrix if eigenvalue m has converged
        m = m-1;                              % (check block upper triangular form)
    end
    k = k+1;
    if k>kmax
        fprintf('WARNING: eigenvalue %i not converged\n',m);
    end
end
A(abs(A)<tol*norm(A))=0; % set sub lower triangular entries to zero