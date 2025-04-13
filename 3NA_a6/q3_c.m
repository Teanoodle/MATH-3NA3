A = [6 2 1; 2 3 1; 3 1 -1];
x_0 = eye(3); % first guess 3 by 3 identity matrix

[Q, B] = orthogit(A, x_0, 100);

disp(Q)
disp(B)

fprintf('\nApproximate first eigenvector:\n');
disp(Q(:,1));

fprintf('Approximate second eigenvector:\n');
disp(Q(:,2));

fprintf('Approximate largest eigenvalue is: %.4f\n', B(1,1));
fprintf('Approximate second largest eigenvalue is: %.4f\n', B(2,2));