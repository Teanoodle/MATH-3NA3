function [A]=vander1(t,n)
% Usage: [A]=vander1(t,n)
% Sets up Vandermonde matrix for n_th order polynomial least squares approximation to data t
% Input:
% t = vector of data
% n = order of fitted polynomial
% Output:
% A = matrix

[m,~]=size(t);

% Calculate Vandermonde matrix
for j=0:n
   for i=1:m
     A(i,j+1) = t(i).^j;
   end
end