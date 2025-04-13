function [grad_f] = grad_f614(x);
% Evaluates nonlinear function of example 6.14
% Input:
% x = 2-dim vector at which to evaluate function
% Output:
% grad_f = 2-dim vector value of gradient of function 

grad_f = [x(1); 5*x(2)];