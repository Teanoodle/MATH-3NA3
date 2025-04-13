A = [3 1 0 0; 1 -1 2 0; 0 2 1 1; 0 0 1 1];
tol = 1e-10;
format long
bisection(A,tol);

fprintf('\n Check, the real eigenvalues are:\n');
disp(eig(A))
