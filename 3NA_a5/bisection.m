function [roots] = bisection(A, tol)
% Input:
% A     = nxn tridiagonal matrix
% tol = toleracne which the routine run over
%
%
% Output:
% roots = eigenvalues by bisection approximation
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
            x = n - sturm(A, m);
            if x < k
                a = m;
            else
                b = m;
            end
        end
        roots(k) = (a + b) / 2;
    end
end