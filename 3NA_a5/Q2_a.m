U = [ 4.083e-01  1.826e-01  8.944e-01;
      8.165e-01  3.652e-01 -4.472e-01;
     -4.083e-01  9.129e-01  6.170e-12 ];

Sigma = diag([7.979e+00, 2.803e-05, 0]);
V = [ 3.070e-01  9.517e-01;
     -9.517e-01  3.070e-01 ];

%% Part(a)
singular = diag(Sigma);
epsilon = 1e-4;
e_r = sum(singular > 0);
n_r = sum(singular > epsilon);

fprintf('Part(a)\n Exact rank(A): %d\n', e_r);
fprintf('Numerical rank(A) with epsilon = le-4: %d\n\n', n_r);

%% Part(b)
A_norm2 = max(singular);
fprintf('Part(b)\n ||A||_2 = %.4f\n\n',A_norm2);


%% Part(c)
nonzero_sin = singular(singular > 0);
cond2_A = max(nonzero_sin) / min(nonzero_sin);
fprintf('Part(c)\n cond_2(A) = %.4e\n\n',cond2_A);

%% Part(d)
sigma1 = singular(1);
u1 = U(:,1);
v1 = V(:,1);
Al = sigma1 * (u1 * v1');
fprintf('Part(d)\n Best rank-one approximation matrix is:\n');
disp(A1),
error_rankl = singular(2);
fprintf('||A - A1||_2 = %.4e \n', error_rankl)