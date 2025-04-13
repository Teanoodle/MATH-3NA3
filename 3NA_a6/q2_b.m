a = [1, 10, -2, 5, 0, 0, 2, -13, 35, -40, 24];
rt = poly_root(a);
disp(rt)

check = roots(a);
disp(check)


rho = max(abs(rt));
disp(rho)