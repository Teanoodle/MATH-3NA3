x = linspace(0.01, 2, 100);

y1 = x;
y2 = -log(x);

figure;
plot(x, y1, 'b-', 'LineWidth', 2);
hold on;
plot(x, y2, 'LineWidth', 2);
rx=fzero(@(x) x+log(x), [0.01,1]);
ry=rx;  %find the intersection point
plot(rx,ry);
text(rx,ry,sprintf('%.4f,%.4f',rx,ry));
hold off;

xlabel('x');
ylabel('y');
legend('y = x', 'y = -log(x)');
