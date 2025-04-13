function [l,V,k] = qr_shift(A,tol,kmax)
% Usage: [l,V,k] = qr_shift(A,tol,kmax)
% Computes all eigenpairs by QR iteration with shifts.
% Input:
% A = matrix
% tol = tolerance
% kmax = max allowable number of iterations
% Output:
% l = vector of eigenvalues
% V = matrix of associated eigenvectors
% k = number of iterations

k = 1;
[~,n]=size(A);
V = eye(n);
m = n;
while m ~= 0
    [Q,R] = qr(A(1:m,1:m)-A(m,m)*eye(m));     % Compute QR factorization
    A(1:m,1:m) = R*Q + A(m,m)*eye(m);         % Generate next matrix
    Qn = eye(n); Qn(1:m,1:m) = Q;             % Form nxn Q matrix
    V = V*Qn;                                 % Update product of unitary transforms
    if norm(A(m,1:m-1),inf) < tol*norm(A,inf)      % Restrict to leading submatrix
        m = m-1;
    end
    k = k+1;
    if k>kmax
        error('Not converged')
    end
end

l = diag(A); % Eigenvalues
