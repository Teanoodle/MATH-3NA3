function [x] = forsub(L,b)
%
% Usage: [x] = forsub(l,b)
%
% Solve lower triangular system Lx = b by back substitution
% matrix is accessed column-wise, and information from previously
% calculated elements of x is integrated progressively by modifying rhs.
%
% Input:
% L = lower triangular matrix
% b = right hand side
%
% Output:
% x = solution vector

[n,~] = size(L); % find size of system

for j = 1:n      % loop over columns
    if L(j,j)==0 % stop if matrix is singular
       disp('Matrix is singular'); 
       break
    end
    x(j) = b(j)/L(j,j);	    
    b(j+1:n) = b(j+1:n) - L(j+1:n,j)*x(j); % update right hand side
end  
x = x'; % transform x from row to column vector       
     