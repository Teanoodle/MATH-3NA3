function count = sturm_sign_agreements(A, theta)
    n = size(A, 1); % Matrix dimension
    
    % Initialize Sturm sequence array (p0 to pn)
    p = zeros(n + 1, 1); 
    p(1) = 1;          % p0 = 1
    
    % Base case handling for small matrices
    if n >= 1
        p(2) = A(1, 1) - theta; % p1 = a11 - θ
    end
    
    if n >= 2
        p(3) = (A(2, 2) - theta) * p(2) - A(2, 1)^2 * p(1); % p2 = (a22 - θ)p1 - a21²p0
    end
    
    % Recursive computation for pk (k >= 3)
    for k = 3:n
        a_kk = A(k, k);         % Main diagonal element
        a_k_kminus1 = A(k, k-1); % Subdiagonal element
        p(k + 1) = (a_kk - theta) * p(k) - a_k_kminus1^2 * p(k - 1);
    end
    
    % Handle zero values by assigning the previous sign
    signs = sign(p);
    for i = 2:length(signs)
        if signs(i) == 0
            signs(i) = signs(i - 1); % Inherit sign from previous term
        end
    end
    
    % Count consecutive sign agreements
    count = 0;
    for i = 2:length(signs)
        if signs(i) == signs(i - 1)
            count = count + 1;
        end
    end
end