xx=linspace(-2.5,2.5,100);y=xx;[xx,y]=meshgrid(xx,y);
f = 2*xx.^3 - 3*xx.^2 - 6*xx.*y.*(xx-y-1);
v=logspace(-2,2,20);
contour(xx,y,f,v);axis('equal');hold on;
contour(xx,y,f,-v);axis('equal');hold on;grid on;
