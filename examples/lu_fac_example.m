%% LU factorization example
clear;        % remove variables from workspace
clc;          % clear command window

n = 5         % size of linear system
A = rand(n)   % (nxn) matrix with random entries
b = rand(n,1) % (nx1) vector with random entries

%% LU factorization
[L,U]=gauss_elim(A) 

%% Solution
x = backsub(U,forsub(L,b));

%% Check answer by evaluating relative residual norm
r = norm(b-A*x)/norm(b)

%% How big is the condition number?
C = cond(A)

