%% QR iteration example
% Compare performance of QR iteration, QR iteration with shifts and QR
% iteration with shifts after reduction to Hessenberg form for symmetric
% matrices, nonsymmetric matrices with eigenvalues distinct in magnitude,
% and matrices with eigenvalues that are not distinct in magnitude.
clear; clc; format short e;

% Choose type of matrix to test
type = "distinct";

if strcmp(type,"symmetric") % symmetric matrix: best case
    A=rand(200);
    %A = A*A'; % symmetric positive definite
    A = tril(A) + triu(A',1); % symmetric

    fprintf('Symmetric matrix. Columns of Q are eigenvectors: expect Schur form B to be diagonal.\n\n')
elseif strcmp(type,"distinct") % specified distinct eigenvalues, nonsymmetric matrix: second best case
    %D = diag([-3 -1 2 4 5 6 7]); % small matrix
    D = diag(linspace(-199,200,200)); % large matrix!
    
    T = rand(size(D));
    A=inv(T)*D*T;

    fprintf('Distinct eigenvalues. Columns of Q matrix are Schur vectors, NOT eigenvectors!\n')
    fprintf('Expect Schur form B to be upper triangular (in general)\n\n')
elseif strcmp(type,"nondistinct") % non-distinct eigenvalues: worst case
    A=diag([-5 -1 -1 2 3 3 4 5 5 5 8]);
    T=rand(size(A));
    A=inv(T)*A*T;

    fprintf('Nondistinct eigenvalues. Columns of Q matrix are Schur vectors, NOT eigenvectors!\n')
    fprintf('Expect Schur form B to be block upper triangular for QR iteration (in general)\n')
    fprintf('or upper triangular for QR with shifts.\n')
end

%% Reference solutions from matlab: uses variant of QR with shifts/deflation
% reduces to Hessenberg form and takes advantage of matrix symmetry
% returns diagonal matrix with eigenvalues

tstart=tic; [V_exact,D] = eig(A); tend=toc(tstart);

% Sort by magnitude of eigenvalues
[l_exact,idx]=sort(real(diag(D)),'descend');
V_exact = V_exact(:,idx);

% Timing (for comparison with our algorithms)
fprintf('\nBuilt-in matlab method for a %s matrix:\n', type)
fprintf('\nCpu time = %0.1es\n', tend)

%% Find all eigenpairs using QR iteration
% The basic QR algorithm.

fprintf('\nQR iteration for a %s matrix:\n', type)
tol=1e-10; kmax=10000;
tstart=tic; [B,V,k] = qr_it(A,tol,kmax);tend=toc(tstart);
%B
spy(abs(B)>tol*norm(B)) % visualize significant elements of B

if strcmp(type,"symmetric") || strcmp(type,"distinct")
    [l,idx]=sort(diag(B),'descend');
    V = V(:,idx);
else % find eigenvalues from block triangular structure
    l=sort(real(eig(B)),'descend');
end

fprintf('\nNumber of iterations = %d cpu time = %0.1es cpu/iteration = %0.1es\n', ...
    k, tend, tend/k)
fprintf('Eigenvalue error  = %0.3e\n', norm(l-l_exact)/norm(l_exact))
if strcmp(type,"symmetric") % do not check Schur vector cases
    fprintf('Eigenvector error = %0.3e\n\n\n', ...
        norm(abs(V)-abs(V_exact))/norm(V_exact))
end

%% Find all eigenpairs using QR iteration with shifts
% Should be much faster than QR iteration without shifts.

fprintf('\nQR iteration with shifts to find all eigenpairs for a %s matrix:\n',type);
tol=1e-10; kmax=5000;
tstart=tic;[B,V,k] = qr_shift_ex(A,tol,kmax);tend=toc(tstart);
%B

% Sort by magnitude of eigenvalues
[l,idx]=sort(real(diag(B)),'descend');
V = V(:,idx);

fprintf('\nNumber of iterations = %d cpu time = %0.1es cpu/iteration = %0.1es\n', ...
    k, tend, tend/k)
fprintf('Eigenvalue error  = %0.3e\n', norm(l-l_exact)/norm(l_exact))
if strcmp(type,"symmetric") % do not check Schur vector cases
    fprintf('Eigenvector error = %0.3e\n\n\n', ...
        norm(abs(V)-abs(V_exact))/norm(V_exact))
end