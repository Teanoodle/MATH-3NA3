function [hess_f] = hess_f69(x);
% Evaluates nonlinear function of question 6.9 p. 304
% Input:
% x = 2-dim vector at which to evaluate function
% Output:
% hess_f = 2x2 hessian matrix

hess_f =[1200*x(1)^2 - 400*x(2) + 2 -400*x(1); -400*x(1) 200;];