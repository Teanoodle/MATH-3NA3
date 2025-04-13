%% Convergence of Rayleigh Quotient iteration
clear
format compact
format short
close all
clc

evals = -2.3:0.8:4.1;
g = sprintf(' %0.2e ', fliplr(evals));
fprintf('\nSpectrum of matrix is [%s]\n\n',g)

B = diag(evals);
[~,n] = size(B);

T=rand(n);

% Compare different types of matrices
A_nondef = T * B * inv(T);        % similarity transform, expect quadratic convergence
A_normal = A_nondef * A_nondef';  % normal matrix, expect cubic convergence

A = A_nondef; % choose type of matrix
%% Plot Gershgorin disks
nphi=256; t=(0:nphi)*2*pi/nphi;
figure; hold on;
for i = 1:n
    c = A(i,i); % Centre
    r = sum(abs(A(i,:))) - abs(A(i,i)); % Radius
    plot( r*cos(t)+c, r*sin(t) ,'b-','linewidth',2);hold on; axis('equal');grid on; % Disk
    plot(c, 0,'ro','MarkerSize',4,'MarkerFaceColor','red');% Eigenvalue
end
xlabel('Re(lambda)'); ylabel('Im(lambda)');title('Gershgorin disks');set(gca,'fontsize',18);hold off;
%% Solve using Rayleigh Quotient iteration
tol=1e-8;
t=cputime;

% Gershgorin estimate for largest eigenvalue (disk edge) ... not always
% useful
[~,i] = max(diag(A));
linit = A(i,i) + sum(abs(A(i,:))) - abs(A(i,i)); 

% Basic estimate (try positive and negative to get largest eigenvalue!)
%linit = norm(A);

vinit = rand(n,1); % random initial estimate for eigenvector

[l,~,k,error] = ray_it(A,linit,vinit,tol);

fprintf('\nRayleigh Quotient iteration:\n')
fprintf('Eigenvalue = %0.5e number of iterations = %d\n\n',l,k)

[l,v,k,errpit] = pow_it_err(A,tol);tend=cputime-t;
fprintf('Power iteration:\n')
fprintf('Eigenvalue = %0.5e number of iterations = %d\n\n',l,k)

figure;loglog(error(1:end-1),error(2:end),'ro-','linewidth',1.5); hold on;grid on;
loglog(errpit(1:end-1),errpit(2:end),'r*-','linewidth',1.5);
loglog(error(1:end-1),error(1:end-1).^3/1e3,'b-','linewidth',1.5);
loglog(error(1:end-1),error(1:end-1).^2/1e3,'g-','linewidth',1.5);
loglog(error(1:end-1),error(1:end-1).^1/1e3,'k-','linewidth',1.5);
legend('Rayleigh iteration','Power iteration','cubic','quadratic','linear');
xlabel('err_k');ylabel('err_{k+1}');
title('Convergence rates for computing eigenvalues');
set(gca,'fontsize',18)



