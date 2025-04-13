x_values = [10, 20, 40]; % Values of x
N_values = 0:150; % Number of terms to consider
threshold = 0.01; % Error threshold (1%)

% Preallocate results
results = zeros(length(x_values), length(N_values));  
min_N_values = zeros(size(x_values));

% Compute relative error for each x and N
for i = 1:length(x_values)
    x = x_values(i);
    for j = 1:length(N_values)
        N = N_values(j);
        % Compute relative error
        results(i, j) = (abs(x)^(N+1)) / factorial(N+1);
    end
end

% Find the smallest N where error < threshold
for i = 1:length(x_values)
    for j = 1:length(N_values)
        if results(i, j) < threshold
            min_N_values(i) = N_values(j);
            break;
        end
    end
end

% Display the results
disp('Smallest N for each x where the error < 1%:');
for i = 1:length(x_values)
    fprintf('x = %d: N = %d\n', x_values(i), min_N_values(i));
end

% Plot relative error vs. N for each x
figure;
hold on;
for i = 1:length(x_values)
    plot(N_values, results(i, :), 'LineWidth', 1.5, ...
         'DisplayName', sprintf('x = %d', x_values(i)));
end
hold off;
xlabel('Number of Terms (N)');
ylabel('Relative Error (\epsilon)');
title('Relative Error vs. Number of Terms');
legend show;
set(gca, 'YScale', 'log'); % Optional: Logarithmic y-axis
grid on;
grid minor;