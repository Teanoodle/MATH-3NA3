function [grad_f] = grad_f67(x);
% Evaluates nonlinear function of example 6.14
% Input:
% x = 2-dim vector at which to evaluate function
% Output:
% grad_f = 2-dim vector value of gradient of function 

grad_f = [6*x(1)^2-6*x(1)-6*x(2)*(x(1)-x(2)-1)-6*x(1)*x(2);-6*x(1)*(x(1)-x(2)-1)+6*x(1)*x(2)];
