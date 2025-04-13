f=@(x) x+log(x);
df=@(x) 1+1/x;

x_=[0.5,0.75];
iter=10;

for j=1:length(x_)
    x=x_(j);
    
    for i=1:iter
        alpha = -1 / df(x);
        x=x + alpha * f(x);
        fprintf('Iteration %d: x = %.8f \n', i, x);
    end
    fprintf('For x0=%.2f, after %d iterations,x= %.4f\n',x_(j), i, x);
end
