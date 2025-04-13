A= [0.4 0.3 0; 0.3 0.7 0.1; 0 0.1 0.65];

D= diag(diag(A));
L=tril(A,-1);
U = triu(A,1);
G_jac = -inv(D)*(L+U);
rho = max(abs(eig(G_jac)));
omega = 2/(1+sqrt(1-rho^2));

disp(G_jac)
disp(rho)
disp(omega)