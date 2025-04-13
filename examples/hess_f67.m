function [hess_f] = hess_f67(x);
% Evaluates nonlinear function of question 6.9 p. 304
% Input:
% x = 2-dim vector at which to evaluate function
% Output:
% hess_f = 2x2 hessian matrix

hess_f =[12*x(1)-6-12*x(2) -12*x(1)+12*x(2)+6;-12*x(1)+12*x(2)+6 12*x(1)];