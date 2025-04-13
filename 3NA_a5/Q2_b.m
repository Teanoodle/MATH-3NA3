U = [ 4.083e-01  1.826e-01  8.944e-01;
      8.165e-01  3.652e-01 -4.472e-01;
     -4.083e-01  9.129e-01  6.170e-12 ];

Sigma = diag([7.979e+00, 2.803e-05, 0]);


V = [ 3.070e-01  9.517e-01;
     -9.517e-01  3.070e-01 ];
V = [V, zeros(2,1)];
V = [V; zeros(1,3)];

A = U * Sigma * V';
Sigma(end,:) = [];

A_2norm = norm(A, 2);
cond2_A = cond(A, 2);

fprintf('||A||_2 = %.6f\n', A_2norm);
fprintf('cond2(A) = %.6e\n', cond2_A);

