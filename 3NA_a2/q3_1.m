A = [1 -1 2; -1 1 -2; 2 -2 4];
b = [1; 0; 0];

nul = null(A);
range = orth(A);

disp(nul)
disp(range)

check = b'*nul;
disp(check)

A = [1 -1 2; -1 1 -2; 2 -2 4];
b = [1; 0; 0];

% Compute orthonormal basis for range(A)
R = orth(A);

% Compute projection of b onto range(A)
b_proj = R * (R' * b);

% Check if b is in range(A)
if norm(b - b_proj) < 1e-10
    disp('b is in range(A)');
else
    disp('b is NOT in range(A)');
end

