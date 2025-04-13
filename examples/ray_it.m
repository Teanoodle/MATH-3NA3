function [l,v,k,error] = ray_it(A,l,v,tol)
% Usage: [l,v,k,error] = ray_it(A,shift,tol)
% Computes eigenpair with eigenvalue closest to sigma with iteration tolerance tol by
% Rayleigh quotient iteration with shifts.
% Input:
% A = matrix
% l = initial guess for eigenvalue
% v = initial guess for eigenvector
% tol = tolerance
% Output:
% l = eigenvalue
% v = associated eigenvector
% k = number of iterations
% error = k-dim vector of errors at each iteration

[~,n]=size(A);
k = 1;
error(1)=norm(A*v-l*v,inf);

while error(k) > tol
    
    y = (A-l*eye(n))\v;     % Solve system using matlab routine
    
    v = y/norm(y,inf);      % Normalize
    
    l = v'*A*v / (v'*v);    % Compute optimal least squares shift
                            % (i.e. optimal eigenvalue)
    k = k+1;
    error(k) = norm(A*v-l*v,inf); % Calculate error
end
