function [R,c,x,err] = qr_house(A,b)
% Usage: [R,c,x,err] = qr_house(A,b)
%
% Computes QR transformation of matrix A to upper triangular form and
% solves least squares problem Rx = c by back substitution
%
% Input variables:
% A = matrix to be transformed
% b = right hand side
%
% Output variables:
% R = upper triangular matrix
% c = transformed right hand side
% x = solution of least square problem
% err = l2 norm of error

R=A;c=b;

[m,n] = size(R); % find size of matrix 
base = eye(m,n); % set up matrix of unit basis vectors

for k = 1:n % loop over columns
  alpha = -sign(R(k,k)) * norm(R(k:m,k),2); 
  v = [zeros(1,k-1) R(k:m,k)']' - alpha * base(:,k);  % compute Householder vector
  bet = v'*v;
  if bet ~= 0 
    for j = k:n % apply transformation
      g = v'*R(:,j);
      R(:,j) = R(:,j) - (2*g/bet) * v;
    end
    g = v'*c;
    c = c - (2*g/bet) * v; % transform rhs
  end
end

x = backsub(R(1:n,1:n),c(1:n)); % Solve upper triangular system
err = norm(c(n+1:m),2);         % l2 norm of error