function [grad_f] = grad_f69(x);
% Evaluates nonlinear function of example 6.9
% Input:
% x = 2-dim vector at which to evaluate function
% Output:
% grad_f = 2-dim vector value of gradient of function 

grad_f = [-400*(x(2) - x(1)^2)*x(1) - 2 + 2*x(1) ; 200*(x(2) - x(1)^2)];
