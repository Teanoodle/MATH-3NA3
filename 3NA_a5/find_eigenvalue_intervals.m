function [roots] = find_eigenvalue_intervals(A,tol)
% Input:
% A     = nxn tridiagonal matrix
% tol = tolerance which the routine run over
%
%
% Output:
% roots


    main_diag = diag(A);
    radius = sum(abs(A), 2) - abs(main_diag); 
    lower = min(main_diag - radius);
    upper = max(main_diag + radius);
    
    n = size(A, 1);
    roots = zeros(n, 1);
    
    for k = 1:n
        a = lower;
        b = upper;
        while (b - a) > tol
            m = (a + b) / 2;
            count = n - sturm_sign_agreements(A, m);
            if count < k
                a = m;
            else
                b = m;
            end
        end
        roots(k) = (a + b) / 2;
    end
    roots = sort(roots); 
end