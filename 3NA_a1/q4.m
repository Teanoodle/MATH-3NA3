% x1
x1 = 1 / sqrt(3);

% initialize
f_112 = [];
f_112(1) = x1;

f_113 = [];
f_113(1) = x1;

pi_112 = [];
pi_113 = [];

% Formulas
for n = 1:26
    f_112(n+1) = (sqrt(f_112(n)^2 + 1) - 1) / f_112(n); % 1.12
    f_113(n+1) = f_113(n) / (sqrt(f_113(n)^2 + 1) + 1); % 1.13
end

% approximation pi
for n = 1:26
    pi_112(n) = 6 * 2^n * f_112(n+1);
    pi_113(n) = 6 * 2^n * f_113(n+1);
end

% result statement
disp('n |   1.12   |   1.13   | Difference');
for n = 1:26
    fprintf('%d | %.15f | %.15f | %.15f  \n', ...
        n, pi_112(n), pi_113(n), abs(pi_112(n) - pi_113(n)));
end