function [f] = f515(x);
% Evaluates 2-dim nonlinear function of example 5.15
% Input:
% x = 2-dim vector at which to evaluate function
% Output:
% f = 2-dim vector value of function 

f = [x(1) + 2*x(2) - 2; x(1)^2 + 4*x(2)^2 - 4];