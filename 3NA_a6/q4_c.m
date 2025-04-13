A0 = [2 4 2; 6 0 8; 3 2 -8];
tol = 1e-16;
kmax = 1000;
[A, V, k] = qr_it(A0, tol, kmax);

fprintf('Approximate Schur form is: \n');
disp(A)

fprintf('Approximate Schur vectors are: \n');
disp(V)
