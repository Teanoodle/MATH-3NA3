A = [0.4 0.3 0; 0.3 0.7 0.1; 0 0.1 0.65];

D = diag(diag(A));
L = tril(A,-1);
U = triu(A,1);

rho_b =max(abs(eig(G_jac)));
omega_b = 2/(1+sqrt(1-rho_b^2));
disp(omega_b)

w_range = linspace(-0.5, 3, 200);
rho_c = zeros(size(w_range));

for i = 1:length(w_range)
    w = w_range(i);
    G = -inv(D+w*L)*(w*U+(w-1)*D);
    rho_c(i) = max(abs(eig(G)));
end

figure;
plot(w_range, rho_c, 'b', 'LineWidth', 2);
xlabel('\omega');
ylabel('\rho)');
grid on;

hold on;
plot(omega_b, interp1(w_range, rho_c, omega_b), 'ro', 'MarkerSize', 8, 'LineWidth', 2);
legend('Spectral Radius', 'Optimal \omega');
hold off;