function [x,iter] = ndimNewton(fun,jac,x0,tol,max_iter)
% Usage: [x,iter] = ndimNewton(fun,jac,x0,tol,max_iter)
% Example: 
% ndimNewton(@(x) [x(1)+2*x(2)-2;x(1)^2+4*x(2)^2-4], @(x) [1 2;2*x(1) 8*x(2)], [1.9;0.9],1e-6,100)
% Solves n-dim problem fun(x) = 0 for x using Newton's method
% Input:
% fun = n-dim nonlinear function
% jac = jacobian of fun (nxn matrix)
% x0 = initial guess (n-dim vector)
% tol = tolerance
% max_iter = maximum allowable number of iterations
% Output:
% x = root (n-dim vector)
% iter = number of iterations to achieve tolerance

x = x0; % initial guess
error = norm(feval(fun,x),2); % initial error	

k = 1;
while error > tol && k <= max_iter
      x = x - feval(jac,x)\feval(fun,x); % compute Newton step
      error = norm(feval(fun,x),2);      % calculate error
      k = k+1;
end
iter = k-1;