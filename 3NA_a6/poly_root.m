function [x] = poly_root(a)

    % Usage: Find the root of the polynomial by finding the eigenvalue of 
    % the adjoint matrix of the polynomial coefficients.
    %
    % Input:    a    The coefficients matrix of each term of the polynomial
    % start with the high order term    a = [a_n, a_n-1, ..., a_1, a_0]
    % Output:   x    Roots of the polynomial


    n = length(a)-1; % order of the polynommial also the size of the companion matrix
    A = zeros(n);  % initialize companion matrix
    A(2:n, 1:n-1) = eye(n-1); % put (n-1)*(n-1) matrix to left lower corner 
    A(:, end) = -fliplr(a(2:end));  % add minus sign to the last column and rearrange a as high-order-term to low-order-term
    x = eig(A);
end