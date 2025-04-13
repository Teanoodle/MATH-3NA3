% Example of using SVD to analyze and compress various grayscale images
%     !! Needs matlab's image processing toolbox !!
%     To install: Home -> Add-Ons, then in Add-on explorer search for 
%     "Image Processing Toolbox" and click install.

% Load grayscale image
clear;
image_type = 'Open'
%image_type = 'Carnation'
%image_type = 'Parrot'
%image_type = 'Forest'

if strcmp(image_type,'Parrot')
    A = imread('parrot_grayscale.png');
elseif strcmp(image_type,'Forest')
    A = imread('forest_grayscale.png');
elseif strcmp(image_type,'Carnation')
    A = imread('Carnation_grayscale.png');
elseif strcmp(image_type,'Open')
    A = imread('osi_grayscale.png');
end
figure(1)
imshow(A)
t=sprintf(['Original ' image_type ' image']); title(t)
set(gca,'fontsize',18)
set(gcf,'position',0.9*get(0,'ScreenSize'))
fprintf([image_type sprintf(' image has size %i x %i = %i entries\n',size(A,1),size(A,2),numel(A))]);
%% SVD decomposition of image matrix (convert to data double precision)
[U,S,V] = svd(double(A));

% Singular values and vectors sorted by magnitude
[sigma, idx] = sort(diag(S),'descend');
U = U(:,idx);
V = V(:,idx);
fprintf([image_type sprintf(' image has a total of %i singular values\n\n',numel(sigma))]);

% Plot singular values
figure(2);plot(sigma,'linewidth',3)
xlabel('rank');ylabel('singular value');
title(sprintf(['Singular values of ' image_type]));
set(gca,'fontsize',18);axis([1 numel(sigma) 0 max(sigma)]); grid on;
set(gcf,'position',0.5*get(0,'ScreenSize'))
%% Plot compressed images with different numbers of singular values
nsigma = 100;

A_best = zeros(size(A));
for i = 1:nsigma
    A_best = A_best + sigma(i) * U(:,i) * V(:,i)';
end

ndata = nsigma + nsigma * 2*size(U,1);

t = sprintf(' approximation using largest %i singular values and %.1f percent of the original data\n', ...
nsigma, 100*ndata/numel(A));
fprintf([image_type t]);

A_img = mat2gray(A_best); % needs image processing toolbox
figure;imshow(A_img);
t = sprintf([image_type sprintf(' image built from %i largest singular values',nsigma);] );
title(t);
set(gca,'fontsize',18)
set(gcf,'position',0.9*get(0,'ScreenSize'))

    