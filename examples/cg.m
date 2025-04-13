function [x] = cg(f, grad_f, hess_f, x0, tol);
% Usage: [x] = cg(f, grad_f, hess_f, x0, tol);
% Implements conjugate gradient algorithm for unconstrained 
% n-dimensional optimization.
% Input:
% f = objective function
% grad_f = gradient of f
% hess_f = hessian of f
% x0 = initial guess
% tol = tolerance
% Output:
% x = minimizer

x(:,1) = x0; 
g = feval(grad_f, x(:,1));
h = feval(hess_f, x(:,1));
s = -g;
k = 2;
while (norm(g,2) > tol)
  g_old = g;                   % Save old gradient
  alpha = -g'*s/(s'*h*s); % Line search using one Newton iteration
  x(:,k) = x(:,k-1) + alpha*s; % Update position
  g = feval(grad_f, x(:,k));   % Update gradient
  h = feval(hess_f, x(:,k));   % Update Hessian
  s = -g + (g'*g)/(g_old'*g_old)*s; % New search direction
  k = k+1;
end
  

