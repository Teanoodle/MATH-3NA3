% Examples of nonlinear equations, or "root finding"
figure;x=(-1:2/1000:1);plot(x,exp(-x)-x,'r',x,0*x,'b','linewidth',2);
set(gca,'fontsize',24);xlabel('x');ylabel('f(x)');grid on;title('$\exp(-x)-x$','interpreter','latex');

figure;x=(-4:2/1000:4);plot(x,x.^2-4*sin(x),'r',x,0*x,'b','linewidth',2);
set(gca,'fontsize',24);xlabel('x');ylabel('f(x)');grid on;title('$x^2-4\sin x$','interpreter','latex')

figure;x=(-2:2/1000:7);plot(x,x.^3-6*x.^2+2*x+6,'r',x,0*x,'b','linewidth',2);
set(gca,'fontsize',24);xlabel('x');ylabel('f(x)');grid on;title('$x^3-6x^2+2x+6$','interpreter','latex');

figure;x=(-2*pi:2/1000:2*pi);plot(x,sin(x).^2-cos(4*pi*x),'r',x,0*x,'b','linewidth',2);
set(gca,'fontsize',24);xlabel('x');ylabel('f(x)');grid on;title('$\sin^2x-\cos(4\pi x)$','interpreter','latex');