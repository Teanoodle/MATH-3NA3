function [hess_f] = hess_f614(x);
% Evaluates nonlinear function of example 6.14
% Input:
% x = 2-dim vector at which to evaluate function
% Output:
% hess_f = 2x2 hessian matrix

hess_f = [1 0; 0 2];