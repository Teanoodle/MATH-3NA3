function [l1,v1,k] = pow_it(varargin)
% Usage: [l1,v1,k] = pow_it(A,tol,x0)
%
% Computes largest eigenpair in magnitude (l1,v1) with tolerance tol by
% power iteration with Rayleigh Quotient. 
%
% Can use optional initial guess for eigenvector v1.
%
% Input:
% A = matrix
% tol = tolerance
% x0 = initial guess (optional)
%
% Output:
% l1 = largest eigenvalue
% v1 = associated eigenvector
% k = number of iterations

% Set variables and initialize eigenvector
if nargin==2
    A = varargin{1};
    [~,n]=size(A);
    tol = varargin{2};
    v1 = rand(n,1); % initialize eigenvector as random vector
else
    A = varargin{1};
    tol = varargin{2};
    x0 = varargin{3};
    v1 = x0;
end
    
error = 1e10;  % initialize error
k = 0; maxit = 1000;
while error > tol && k <= maxit
      y = A*v1;
      v1 = y/norm(y,inf);           % normalize

      l1 = (v1'*A*v1)/(v1'*v1);     % compute eigenvalue l1 of A corresponding
                                    % to e-vector v1 using Rayleigh quotient  

      error = norm(A*v1-l1*v1,inf); % residual error
      k = k+1;
end
if k > maxit
    disp(['Maximum number of iterations reached without achieving tolerance, error = ' sprintf('%0.5g',error)]);
end
