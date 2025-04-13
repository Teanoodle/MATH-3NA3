% Example: n-dimensional Newton method for roots of nonlinear equations

clear; clc; format short

f  = @(x) [x(1) + 2*x(2) - 2; x(1)^2 + 4*x(2)^2 - 4]; % nonlinear function f(x)
Jf = @(x) [1 2; 2*x(1) 8*x(2)];                       % Jacobian matrix of f(x)

tol  = 1e-6; % tolerance for Newton solver
nmax = 100; % maximum number of iterations for Newton solver

%% First case with initial guess [1.9; 0.9]

x0 = [1.9; 0.9];

[x1,iter1] = ndimNewton(f, Jf, x0, tol, nmax)

% Check result (absolute residual error)
err1 = norm(f(x1))

%% Second case with initial guess [1.9; 1.0]

x0 = [1.9; 1.0];

[x2,iter2] = ndimNewton(f, Jf, x0, tol, nmax)

% Check result (absolute residual error)
err2 = norm(f(x2))