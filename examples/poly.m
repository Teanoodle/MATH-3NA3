function [f]=poly(t,x);
% Usage: [f]=poly(t,x);
% Calculates polynomial based on x parameters.
% Input: 
% t = data points
% x = coefficients of polynomial
% Output:
% f = polynomial function

[n,m]=size(x);

f = 0;
for i = 1:n
  f = f + x(i)*t.^(i-1);
end