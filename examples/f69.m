function [f] = f69(x);
% Usage: [f] = f69(x);
% Evaluates nonlinear function of question 6.9
% Input:
% x = 2-dim vector at which to evaluate function
% Output:
% f = 1-dim vector value of function 

f = 100*(x(2)-x(1)^2)^2 + (1-x(1))^2;
