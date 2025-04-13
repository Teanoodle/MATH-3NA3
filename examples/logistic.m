%% Logistic curve data
clear; clc; close all

% Plot exact model curve (logistic curve)
tfit=linspace(-5,5,200); 
exact=1./(1+exp(-tfit)); 
plot(tfit,exact,'k','LineWidth',2); grid on; hold on; axis([-5 5 -0.2 1.2]);

% Plot "noisy" data points
t=linspace(-5,5,10); 
y = 1./(1+exp(-t)) + (rand(1,numel(t))-0.5)/4; % perturbed logistic curve data
t=t.';y=y.';
plot(t,y,'bo','MarkerSize',8,'MarkerFaceColor','b'); hold on;
xlabel('t');ylabel('P(t)');set(gca,'fontsize',18);title('Logistic curve for population growth');
legend('logistic curve', 'noisy data') 
%% Least squares fit to cubic polynomial
[R,c,x,err] = qr_house(vander1(t,3),y);
plot(tfit,poly_calc(tfit,x),'r','linewidth',2); hold off;
legend('noisy data','logistic curve','cubic polynomial fit')
%% Error as a function of polynomial order
for j = 1:numel(y)-1
    plot(t,y,'bo','MarkerFaceColor','b','MarkerSize',8);
    xlabel('t'); ylabel('P(t)'); grid on; hold on; axis([-4 4 -0.2 1.2]);set(gca,'fontsize',18);
    plot(tfit,exact,'k','LineWidth',2);
    [R,c,x,err] = qr_house(vander1(t,j),y);
    title(['Polynomial order n = ',num2str(j), ' Error = ', num2str(err)])
    plot(tfit,poly_calc(tfit,x),'r','linewidth',2); hold off;
    pause(2)
end
