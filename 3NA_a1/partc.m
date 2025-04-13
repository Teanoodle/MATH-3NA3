x = [10, 20, 40]; % values of x input
e = 0.01; % relative error
k = 60; % number of terms in the series
exact = exp(x);

% initialize an empty array (relative error)
re = zeros(k, length(x));

% calculate relative error
for i = 1:length(x)
    for n = 1:k
        approx = sum((x(i).^(0:n-1)) ./ factorial(0:n-1));

        re(n ,i) = abs((approx- exact(i)) / exact(i));
        if re(n,i) < e
            break;
        end
    end
end

% draw the graph
figure;
hold on;
grid on;
xlabel('n');
ylabel('(\epsilon)');
title('(\epsilon) vs n');
for i = 1:length(x)
    plot(1:k, re(:, i), 'o-', 'DisplayName', ['x = ' num2str(x(i))]);
end
yline(e, 'r--', 'DisplayName', '1% Error');
legend('show');
hold off;

% result statement
for i = 1:length(x)
    min_re = find(re(:, i) < e, 1);
    if isempty(min_re)
        fprintf('When x = %d, %d term is still not enough to reach 0.01 relative error, need more terms.\n', x(i), k);
    else
        fprintf('When x = %d, %d term reaches relative error less than 0.01.\n', x(i), min_re);
    end
end
