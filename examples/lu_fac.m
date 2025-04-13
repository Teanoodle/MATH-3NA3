function [x]=lu_fac(A,b)
%
% Usage: [x]=lu_fac(A,b)
%
% Solves the linear system Ax = b by LU factorization LUx = b
%
% Input:
% A = matrix
% b = right hand side vector
%
% Output:
% x = solution vector

[L,U] = gauss_elim(A);      % LU factorization of A
x = backsub(U,forsub(L,b)); % solve LUx = b
