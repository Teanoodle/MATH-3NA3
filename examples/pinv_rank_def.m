% Pseudoinverse least squares solution for numerically rank deficient
% matrix
clear;clc; format compact;

A = [-1 1 0; -1 0 1; 0 -1 1]
b = [711; 1177; 475]

% SVD factorization
[U,S,V]=svd(A)

%% Third singular value should be neglected in floating point computation 
fprintf('\n Neglect third singular value since S_3 < eps S_1: %0.2e < %0.2e\n\n', ... 
    S(3,3),eps*S(1,1))

%% Compute SVD solution to least squares, neglecting smallest singular value

x = U(:,1)'*b/S(1,1) * V(:,1) + U(:,2)'*b/S(2,2) * V(:,2)

%% Compare with matlab solutions

x_mat = pinv(A)*b % matches our solution
norm(x_mat-x)/norm(x)
A\b       % does not deal with rank deficient problem!