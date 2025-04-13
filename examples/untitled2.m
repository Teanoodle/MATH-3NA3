%% Orthogonal iteration with convergence analysis
clear; clc; close all;

% Matrix A (same as Exercise 4.15)
A = [6 2 1; 2 3 1; 3 1 -1];
n = size(A, 1);

% Ground truth: use eig to get "true" dominant eigenvectors
[V_true, ~] = eig(A);
% We'll compare convergence to the space spanned by first eigenvector
v_exact = V_true(:,1) / norm(V_true(:,1));

% Initial guess: first 3 columns of identity
Q = eye(n);
max_iter = 20;
tol = 1e-12;

error = zeros(max_iter, 1);  % track error for convergence rate

% Perform orthogonal iteration
for k = 1:max_iter
    X = A * Q;              % Multiply A * Q_{k-1}
    [Q, ~] = qr(X);         % QR decomposition to get new orthonormal Q_k

    % Error = sin(angle between v_exact and span(Q(:,1)))
    % Since both are unit vectors, angle error = norm of cross component
    e_k = 1 - abs(v_exact' * Q(:,1)); % or use norm(v_exact - Q(:,1))
    error(k) = e_k;

    if e_k < tol
        error = error(1:k); % trim
        break
    end
end

%% Log-log plot of convergence
figure; hold on;
loglog(error(1:end-1), error(2:end), 'ro-', 'LineWidth', 2); grid on;

% Plot reference lines
e_vals = error(1:end-1);
loglog(e_vals, e_vals, 'k--', 'DisplayName', 'Linear');
loglog(e_vals, e_vals.^2, 'g--', 'DisplayName', 'Quadratic');
loglog(e_vals, e_vals.^3, 'b--', 'DisplayName', 'Cubic');

xlabel('Error_k'); ylabel('Error_{k+1}');
title('Convergence Rate of Orthogonal Iteration');
legend('Orthogonal Iteration', 'Linear', 'Quadratic', 'Cubic');
set(gca, 'FontSize', 14);
