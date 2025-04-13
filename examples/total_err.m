function []=total_err(order)
% Plots total error for derivative of sin(x)
% Input
% order = order of finite difference approximation (1 or 2)
x0=1;
n=100;
h=logspace(-16,0,n);

for i = 1:n
    if order==1
       error(i) = abs(cos(x0) - (sin(x0+h(i))-sin(x0))./h(i));
    elseif order==2
       error(i) = abs(cos(x0) - (sin(x0+h(i))-sin(x0-h(i)))./(2*h(i)));
    else
       disp('Incorrect order')
    end
end

%Plot results
loglog(h,error);xlabel('h');ylabel('absolute error');grid on;set(gca,'fontsize',24);

