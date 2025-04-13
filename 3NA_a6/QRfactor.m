function [Q,R]=QRfactor(A)
% QR factorization of n x k matrix A
% 
% Input:
% A = input matrix
%
% Output:
% Q = n x k left-orthogonal matrix
% R = k x k upper triangular matrix with positive diagonal entries
% A = Q*R

[~,k] = size(A);
for j = 1:k
    Q(:,j) = A(:,j);
    for i = 1:j-1
        R(i,j) = Q(:,i)' * A(:,j);
        Q(:,j) = Q(:,j) - R(i,j) * Q(:,i);
    end
    R(j,j) = norm(Q(:,j));
    if  R(j,j) == 0
        error('matrix is not of full rank')
    end
    Q(:,j) = Q(:,j)/R(j,j);
end
