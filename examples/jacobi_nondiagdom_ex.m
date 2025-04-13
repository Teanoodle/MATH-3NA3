%% Non diagonally dominant Jacobi example
clear all; clc
% Non diagonally dominant matrix
A=[3 4 2 -2; -1 -6 3 3; 2 5 3 -2; 4 2 -2 8]

%% Check the spectral radius of its Jacobi iteration matrix
D = diag(diag(A));
L = tril(A,-1);
U = triu(A,1);
G_jac = -inv(D)*(L+U);

% spectral radius
rho = max(abs(eig(G_jac)))

%% But other norms are greater than one (can tell whether Jacobi converges)
norm2 = norm(G_jac,2)
norm1 = norm(G_jac,1)
norminf = norm(G_jac,inf)

%% Estimate number of iterations K to have 6 correct digits
% (assume zero correct digits initially)
K = round(-6/log10(rho))

%% Verify this estimate
b= [-2 3 2 5]';
[x,iter,err_bnd] = jacobi(A,b,1e-6,2*K);
iter
%% Check error bounds
true_error = norm(A\b-x)/norm(x)
res_error = norm(b-A*x)/norm(b);
upper_bound = res_error*cond(A)
lower_bound = res_error/cond(A)






