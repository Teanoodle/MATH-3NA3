function [f] = f67(x);
% Usage: [f] = f67(x);
% Evaluates nonlinear function of example 6.14
% Input:
% x = 2-dim vector at which to evaluate function
% Output:
% f = 1-dim vector value of function 

f = 2*x(1)^3-3*x(1)^2-6*x(1)*x(2)*(x(1)-x(2)-1);