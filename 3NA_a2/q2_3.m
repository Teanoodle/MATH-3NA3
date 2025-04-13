function [L,U]=gauss_elim(A)
    [n,~]=size(A);
    for k=1:n-1
        if A(k,k)==0
            break;
        end
        A(k+1:n,k)=A(k+1:n,k)/A(k,k); 
        for j = k+1:n
            A(k+1:n,j) = A(k+1:n,j) - A(k+1:n,k)*A(k,j); 
        end
    end
    U = triu(A); 
    L = tril(A,-1)+eye(n); 
end

B = [0.1 0.2 0.3;
     0.4 0.5 0.6;
     0.7 0.8 0.9];
b = [0.1; 0.3; 0.5];

[L, U] = gauss_elim(A);
y = L\b;
x = U\y;
disp(x);

k = cond(A);
disp(k)