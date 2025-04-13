function [Q,B] = orthogit(A,X0,maxit)
% Orthogonal iterations for the first p eigenvalues of A
%
% Input:
% A     = nxn matrix
% X0    = nxp initial matrix of eigenvectors
% maxit = number of iterations
%
% Output:
% Q = nxp left-orthogonal matrix
% B = pxp block-triangular matrix

X = X0;
for i = 1:maxit
    [Q,~] = QRfactor(X);
    X = A*Q;
end
B = Q'*A*Q;
