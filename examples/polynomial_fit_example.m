% Polynomial least squares curve fit example
clear
t = [1 2 3 4 5]';
y = [0.5 3.2 4.6 7.6 8.2]';

% Fit degree p polynomial
p = 1; 
% Use QR algorithm to fit polynomial
% Vandermonde matrix gives matrix A for polynomials
[R,c,x,err] = qr_house(vander(t,p),y); 

% Compare fit
tfit =linspace(1,5,100); % Use more points to visualize fitted curve
plot(t,y,'ro','linewidth',1.5);xlabel('t');ylabel('y'); hold on;grid on;
plot(tfit, poly(tfit,x),'b-','linewidth',1.5);set(gca,'fontsize',18);
title('Least squares fit with polynomial model functions');

