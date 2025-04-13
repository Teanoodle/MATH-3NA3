x = [1.02, 0.95, 0.77, 0.67, 0.56, 0.30, 0.16, 0.01]';
y = [0.39, 0.32, 0.22, 0.18, 0.15, 0.12, 0.13, 0.15]';

del_x = [1.2e-3, 6.4e-3, -4.8e-3, 2.8e-3, -1.4e-3, 3.2e-3, 3.6e-3, -9.0e-4]';
del_y = [-4.8e-3, 1.9e-3, 3.2e-3, 4.8e-3, -2.1e-3, 2.4e-3, -5.0e-3, 2.2e-3]';

x_p = x + del_x;
y_p = y + del_y;

A = [y.^2, x.*y, x, y, ones(size(x))];
b = x.^2;
[R,c,params_1,err] = qr_house(A, b);

A_p = [y_p.^2, x_p.*y_p, x_p, y_p, ones(size(x_p))];
b_p = x_p.^2;
[R,c,params_2,err] = qr_house(A_p, b_p);

a1=params_1(1); b1=params_1(2); c1=params_1(3); d1=params_1(4); e1=params_1(5);

a2=params_2(1); b_2=params_2(2); c2=params_2(3); d_2=params_2(4); e2=params_2(5);

%% Compute norm
param_change = norm(params_2 - params_1);
perturbation_size = norm([del_x; del_y]);
fprintf('Original parameters: \n');
fprintf('a = %.4f, b = %.4f, c = %.4f, d = %.4f, e = %.4f\n', a1, b1, c1, d1, e1);

fprintf('Perturbed parameters: \n');
fprintf('a = %.4f, b = %.4f, c = %.4f, d = %.4f, e = %.4f\n', a2, b_2, c2, d_2, e2);

fprintf('Size of the change in the parameters: %.4f\n', param_change);
fprintf('Size of perturbation: %.4f\n', perturbation_size);

%% Plot ellipse graph
f1 = @(x, y) a1*y.^2 + b1*x.*y + c1*x + d1*y + e1 - x.^2;
f2 = @(x, y) a2*y.^2 + b_2*x.*y + c2*x + d_2*y + e2 - x.^2;

figure;
hold on;
grid on;
axis equal;
fimplicit(f1, [-1.5, 1.5, -1.5, 1.5]);
fimplicit(f2, [-1.5, 1.5, -1.5, 1.5]);
plot(x, y, 'bo', 'MarkerSize',3,'MarkerFaceColor','b');
plot(x_p, y_p, 'ro', 'MarkerSize',3,'MarkerFaceColor','r');
xlabel('x'); ylabel('y');
legend('Original Orbit', 'Perturbed Orbit', 'Original Data', 'Perturbed Data');
hold off;
