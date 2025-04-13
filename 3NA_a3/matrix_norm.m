function lambda_p = matrix_norm(A, p)
    % Input:
    % A - Matrix
    % p - The norm type (1, 2, or 'inf')
    % Output:
    %   lambda_p - The computed norm of the Jacobi iteration matrix

    D = diag(diag(A));
    L = tril(A, -1);
    U = triu(A, 1);
    G_jac = -inv(D) * (L + U);
    lambda_p = norm(G_jac, p);
end
