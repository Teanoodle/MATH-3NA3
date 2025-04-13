k = 1:20;
e_exact = exp(1); % exact value of e
% initialize computerized e and relative error
e_compute = [];
re = [];

% computing
for i = k
    n = 10^i;
    e_compute(i) = (1 + 1/n)^n; % computed e
    re(i) = abs(e_compute(i) - e_exact) / abs(e_exact); % relative error
end

% result statement
fprintf('k\t  Computed_e\t  \tRelative_error  \n');
for i = k
    fprintf('%d\t  %.15f\t  %.15f\t  \n', i, e_compute(i), re(i));
end