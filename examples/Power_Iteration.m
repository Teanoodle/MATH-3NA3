%% Power and inverse power iteration examples
clear; clc; close all
format short; format compact

% Set up matrix with defined eigenvalues
evals = [6 5 4 -0.5 -3]; % define eigenvalues
Adiag = diag(evals,0);   % diagonal matrix with eigenvalues on diagonal
[~,n] = size(Adiag);

T=rand(n);               % matrix for similarity transform

A = T * Adiag * inv(T)   % similarity transform of diagonal matrix (preserves eigenvalues)
                         % A is not diagonally dominant!

%A = Adiag + T/n          % diagonally dominant case

tol = 1e-10;             % tolerance for calculations

evals = sort(eig(A),'descend');
g = sprintf(' %0.1f ', evals);
fprintf('\nEigenvalues are:\n %s\n',g) % check eigenvalues

%% Largest eigenpair (in magnitude) using power iteration
[l1,v1,k1] = pow_it(A,tol);
g = sprintf(' %0.2e ', v1);
fprintf('\nLargest eigenpair:\nl1 = %0.1e v1 = [%s]\nConverges in %d iterations.\n\n',l1,g,k1)

%% Smallest eigenpair (in magnitude) using inverse power iteration
[ln,vn,kn] = inv_pow_it(A,tol);
g = sprintf(' %0.2e ', vn);
fprintf('\nSmallest eigenpair:\nl1 = %0.1e v1 = [%s]\nConverges in %d iterations.\n\n',ln,g,kn)

%% Intermediate eigenvalue using shifts

% Plot Gershgorin disks
nphi=256; t=(0:nphi)*2*pi/nphi;
for i = 1:n
    c = A(i,i); % Centre
    r = sum(abs(A(i,:))) - abs(A(i,i)); % Radius
    plot( r*cos(t)+c, r*sin(t) ,'b-','linewidth',2);hold on; axis('equal');grid on; % Disk
    plot(c, 0,'ro','MarkerSize',4,'MarkerFaceColor','red');% Eigenvalue
end

% Plot upper bound disk for all eigenvalues
r=norm(A,inf); % Why inf? Recall that inf is max |row| sum
plot(r*cos(t),r*sin(t),'g-','LineWidth',2);
plot((-3:0.1:6),0.*(-3:0.1:6),'m-','linewidth',4); % range of actual eigenvalues
xlabel('Re(lambda)'); ylabel('Im(lambda)');title('Gershgorin disks');set(gca,'fontsize',18);hold off;

%% Try to find different eigenvalues
% Most negative eigenvalue
shift=-20; [l,v,k] = inv_pow_it(A-shift*eye(n,n),tol); l=shift+l % Shift back
g = sprintf(' %0.2e ', v);
fprintf('\nMost negative eigenvalue:\nl = %0.1e v = [%s]\nConverges in %d iterations.\n\n',l,g,k)
%% Eigenvalue closest to 4.3
shift=4.3; [l,v,k] = inv_pow_it(A-shift*eye(n,n),tol); l=shift+l % Shift back
g = sprintf(' %0.2e ', v);
fprintf('\nEigenvalue closest to 4.3:\nl = %0.1e v = [%s]\nConverges in %d iterations.\n\n',l,g,k)

%% What if our initial guess is intermediate between two eigenvalues?
shift=4.5; [l,v,k] = inv_pow_it(A-shift*eye(n,n),tol); l=shift+l 

%% Try a (really) large matrix
n=100; tol = 1e-6;
A=rand(n,n); A=A'*A; % Positive eigenvalues
[v,d]=eig(A);
[l1,v1,k1] = pow_it(A,tol);
[ln,vn,kn] = inv_pow_it(A,tol);

l1_exact = max(max(abs(diag(d)))); % largest magnitude eigenvalue
ln_exact = min(min(min(diag(d)))); % smallest magnitude eigenvalue

fprintf('\nLargest eigenvalue:  l1 = %0.1e with error = %0.2e.\n',l1,abs(l1_exact-l1))
fprintf('\nSmallest eigenvalue: ln = %0.1e with error = %0.2e.\n',ln,abs(ln_exact-ln))

