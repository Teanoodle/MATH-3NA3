function [x] = sturm(A,theta)
% The number of agreements in sign between
% consecutive members of the sequence gives the number of eigenvalues which are strictly
% greater than θ for a tridiagonal matrix. 
%
% Input:
% A     = nxn tridiagonal matrix
% theta = a real number which used to compare the size of an eigenvalue.
%
%
% Output:
% x     = number of eigenvalues bigger than theta (number if sign
% agreements)


x = 0; % Initialize the number of eigenvalues counting
m = size(A,1); % get m row
p = zeros(m,1); % index the sequence of polynomials
p(1) = 1; % p_0 = 1; Since array indices must be positive integers or logical values.
p(2) = A(1,1) - theta; % p_1
p(3) = (A(2,2) - theta)*(A(1,1) - theta) - A(2,1)^2;

for i = 4:m+1  % from p_3, i.e k=3
    diag_entry = A(i-1,i-1); % a_k,k
    previous_entry = A(i-1,i-2); % a_k,k-1
    p(i) = (diag_entry - theta) * p(i-2) - (previous_entry^2) * p(i-3);
end

for i = 2:m+1
    if p(i) == 0
        si = sign(p(i-1));
    else
        si = sign(p(i)); % If p(k) = 0, then it is given the same sign as p(k-1)
    end
    if sign(p(i-1)) == si
        x = x + 1;
    end
end
end

