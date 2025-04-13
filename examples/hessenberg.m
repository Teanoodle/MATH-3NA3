function [U,B] = hessenberg(A)
% Reduces square matrix A to upper Hessenberg form B
% (zeros below first subdiagonal)
% using unitary Householder transforms H * A * H.
%
% Householder vector for column i to annihilate all entries below 
% first sub-diagonal:
%
% a = A(i+1:n,i)                     (subdiagonal entries of column i)
% a(1) = a(1) + sign(a(1)) * norm(a) (modify first entry of vector a)
% w = [0 ... 0 a]                    (complete Householder vector of size n)
%
% Input:
% A = matrix to be reduced to upper Hessenberg form
%
% Output:
% U = unitary matrix such that B = U' A U
% B = upper Hessenberg form

[n,~] = size(A); U = eye(n);
for i = 1:n-2
    a = A(i+1:n,i);
    a(1) = a(1) + sign(a(1)) * norm(a);
    v = zeros(i,1);
    w = [v; a];
    H = eye(n) - 2*(w*w')/(w'*w);
    A = H * A * H;
    U = U * H;
end
B = A;
end