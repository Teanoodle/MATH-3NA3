function [L,U]=gauss_elim(A)
%
% Usage: [L,U]=gauss_elim(A)
%
% Reduces matrix A to upper triangular form using Gaussian elimination
%
% Input:
% A = input matrix
%
% Output:
% L = lower triangular transformation of A
% U = upper triangular transformation of A

[n,~]=size(A);
for k=1:n-1    % loop over columns
    if A(k,k)==0
        break; % stop if pivot is zero
    end
    % Compute multipliers and store them below diagonal 
    % where eliminated entries would go
    A(k+1:n,k)=A(k+1:n,k)/A(k,k); 
    % Apply transformation to remaining columns
    for j = k+1:n
        A(k+1:n,j) = A(k+1:n,j) - A(k+1:n,k)*A(k,j); 
    end
end
% Upper trianguler matrix from transformed matrix A
U = triu(A); 

% Unit lower triangular matrix formed from multipliers
L = tril(A,-1)+eye(n);
