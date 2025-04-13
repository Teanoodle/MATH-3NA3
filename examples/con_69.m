xx=linspace(-3,3,100);yy=xx;[xx,yy]=meshgrid(xx,yy);
f = 100.*(yy-xx.^2).^2 + (1-xx).^2;
v=logspace(-3,4,20);
contour(xx,yy,f,v);axis('equal');hold on;
contour(xx,yy,f,-v);axis('equal');hold on;grid on;hold off;
