function rho = converge_iterative(A,type,w)
% Calculates spectral radius (rate of convergence) for Jacobi, Gauss-Seidel
% or SOR applied to matrix A
% Input:
% A = matrix
% w = omega parameter for SOR
% type = iterationn method: jacobi, gauss-seidel, sor
% Output:
% rho = spectral radius of iteration matrix (<1 necessary and sufficient
% condition for convergence)

% Form interation matrix G=M^(-1)N
D = diag(diag(A));
L = tril(A,-1);
U = triu(A, 1);
switch type
    case 'jacobi'
        G = -inv(D)*(L+U);
    case 'gauss-seidel'
        G = -inv(D+L)*U;
    case 'sor'
        G = -inv(D+w*L)*(w*U+(w-1)*D);
end

rho = max(abs(eigs(G)));