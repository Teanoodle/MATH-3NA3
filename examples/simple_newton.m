function [root] = simple_newton(x0,tol);
% Usage: [root] = simple_newton(x0,tol);
% Finds the root of floating sphere cubic using Newton's method
% Input:
% x0 - initial guess for root
% tol - desired absolute error
% Output:
% root - approximate root
format long e;
error = 1e10;
xk=x0;
k=0;
while error > tol
      k=k+1;
      xk = xk - (xk^2 - (xk^3+1)/3)/(2*xk - xk^2);
      error = abs(xk^2-(xk^3+1)/3);
      disp(['Iteration' sprintf('%2i',k) ' approx root ' ...
      sprintf('%15.13f',xk) ' abs error ' sprintf('%3.2e',error)] )		  
end
root=xk;

