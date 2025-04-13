function [J] = jac515(x);
% Usage: [J] = jac515(x);
% Evaluates Jacobian matrix at vector x
% (definition is hard-wired for the particular non-linear function in
% example 5.15)
% Input:
% x = vector at which to evaluate Jacobian
% Output:
% J = Jacobian matrix

J = [1 2; 2*x(1) 8*x(2)];