function [alpha] = line_search(f,grad_f,hess_f,alpha0,x,s,tol);

alpha = alpha0;
while norm(feval(hess_f(x+alpha*s),inf) > tol
  alpha = alpha - feval(grad_f(x+alpha*s))'*(x+alpha*s)/...
	  ((x+alpha*s)'*feval(hess_f(x+alpha*s))*(x+alpha*s))
end