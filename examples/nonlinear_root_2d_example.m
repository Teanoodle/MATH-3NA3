%% Two-dimensional nonlinear roots example
% Plot roots of two-dimensional nonlinear equation graphically 
% as parameter gamma changes
clear

% Define two-dimensional functions f1, f2 : R^2 -> R^2
% Roots are defined by intersection of level curves f1(x1,x2) = 0 and f2(x1,x2) = 0
f1 = @(x1,x2,gamma)  x1.^2 - x2    + gamma;
f2 = @(x1,x2,gamma) -x1    + x2.^2 + gamma;

x=linspace(0,1,200);[x,y]=meshgrid(x,x);    % generate grid

%% Two roots with gamma = 0.2
gamma = 0.2;
contour(x,y,f1(x,y,gamma),[0 0],'b','linewidth',1.5); % plot contour f1 = 0
hold on;
contour(x,y,f2(x,y,gamma),[0 0],'r','linewidth',1.5); % plot contour f2 = 0
grid on;axis('equal');xlabel('x_1');ylabel('x_2');title('Gamma = 0.2, two roots');
set(gca,'fontsize',20)

%% One root with gamma = 0.25
gamma = 0.25;
figure;
contour(x,y,f1(x,y,gamma),[0 0],'b','linewidth',1.5); % plot contour f1 = 0
hold on;
contour(x,y,f2(x,y,gamma),[0 0],'r','linewidth',1.5); % plot contour f2 = 0
grid on;axis('equal');xlabel('x_1');ylabel('x_2');title('Gamma = 0.25, one root');
set(gca,'fontsize',20)

%% Zero roots with gamma = 0.3
gamma = 0.3;
figure;
contour(x,y,f1(x,y,gamma),[0 0],'b','linewidth',1.5); % plot contour f1 = 0
hold on;
contour(x,y,f2(x,y,gamma),[0 0],'r','linewidth',1.5); % plot contour f2 = 0
grid on;axis('equal');xlabel('x_1');ylabel('x_2');title('Gamma = 0.3, zero roots');
set(gca,'fontsize',20)
