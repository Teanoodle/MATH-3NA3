% Low rank approximation example
clear;clc;format compact; 

A = [0.913 0.659; 0.780 0.563; 0.457 0.330]

[U,S,V] = svd(A)

%% Rank 1 approximation

A1 = S(1,1) * U(:,1)*V(:,1)'

error = norm(A-A1)/norm(A)