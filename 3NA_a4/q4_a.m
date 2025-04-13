x = [1.02, 0.95, 0.77, 0.67, 0.56, 0.30, 0.16, 0.01]';
y = [0.39, 0.32, 0.22, 0.18, 0.15, 0.12, 0.13, 0.15]';

A = [y.^2, x.*y, x, y, ones(size(x))];
b = x.^2;

[R,c,params,err] = qr_house(A,b);

a=params(1);b=params(2);c=params(3);d=params(4);e=params(5);
fprintf('a = %.4f, b = %.4f, c = %.4f, d = %.4f, e = %.4f\n', a, b, c, d, e);

f = @(x, y) a*y.^2 + b*x.*y + c*x + d*y + e - x.^2; % ellipse fucntion

figure;
hold on;
axis equal;
fimplicit(f, [-1.5, 1.5, -1.5, 1.5]);
plot(x, y, 'bo', 'MarkerSize',4, 'MarkerFaceColor','b');
xlabel('x'); ylabel('y');
legend('Orbit', 'Data Points');
grid on;
hold off;
