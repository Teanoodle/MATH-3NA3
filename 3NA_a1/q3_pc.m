b = 2;
p = 3;
L = -2;
U = 2;

bi_mant = ["0.00", "1.00", "1.01", "1.10", "1.11"]; % binary mantissa
de_mant = []; % initialize to store decimal mantissa

for i = 1:length(bi_mant)
    parts = split(bi_mant(i), '.'); % split binary mantissa into integer and fractional parts
    integer = bin2dec(parts{1}); % convert integer part
    frac = 0; % initialize fractional part
    if length(parts) > 1
        frac_digit = parts{2};
        for j = 1:length(frac_digit)
            frac = frac + str2double(frac_digit(j)) * 2^(-j); % convert fraction part
        end
    end

    % combine integer and fractional parts to get decimal mantissas
    de_mant(i) = integer + frac;
end

% decimal mantissas:
disp(de_mant);

% initialize 
num = [];

for e = L:U
    for m = de_mant
        num = [num, m * b^e]; % Positive numbers
        num = [num, -m * b^e]; % Negative numbers
    end
end

% drawing plot
num = sort(num);
figure;
grid on;
plot(num, zeros(size(num)), 'o');
xlabel('Values');

