%% Sequential Search
function index = sequential_search(arr, target)
    index = -1; % Default index if not found
    for i = 1:length(arr)
        if arr(i) == target
            index = i; % Found the target
            return;
        end
    end
end

%% Maximum Value of an Array
function max_val = max_value(arr)
    max_val = arr(1); % Initialize with the first element
    for i = 2:length(arr)
        if arr(i) > max_val
            max_val = arr(i);
        end
    end
end

%% Element Uniqueness Problem
function is_unique = element_uniqueness(arr)
    is_unique = true; % Assume uniqueness
    for i = 1:length(arr)
        for j = i+1:length(arr)
            if arr(i) == arr(j)
                is_unique = false;
                return;
            end
        end
    end
end

%% Matrix Multiplication
function C = matrix_multiply(A, B)
    [m, n] = size(A);
    [n2, p] = size(B);
    if n ~= n2
        error('Matrix dimensions do not match for multiplication');
    end
    C = zeros(m, p); % Initialize the result matrix
    for i = 1:m
        for j = 1:p
            for k = 1:n
                C(i, j) = C(i, j) + A(i, k) * B(k, j);
            end
        end
    end
end

%% Prove 3x^2 + 8xlog(x) = Θ(x^2) (Demonstration Code)
function prove_big_theta()
    x = 1:1000; % Define a range of x values
    y = 3*x.^2 + 8*x.*log2(x); % Given function
    figure;
    plot(x, y, 'LineWidth', 2);
    hold on;
    plot(x, 3*x.^2, '--r', 'LineWidth', 2); % Dominant term
    legend('3x^2 + 8xlog(x)', '3x^2');
    title('Demonstrating Θ(x^2)');
    xlabel('x');
    ylabel('Function value');
    hold off;
end

%% Factorial (Recursive)
function fact = factorial_recursive(n)
    if n == 0 || n == 1
        fact = 1;
    else
        fact = n * factorial_recursive(n - 1);
    end
end

%% Number of Binary Digits
function num_digits = binary_digits(n)
    if n == 0
        num_digits = 1;
    else
        num_digits = floor(log2(n)) + 1;
    end
end

%% Tower of Hanoi
function tower_of_hanoi(n, from, to, aux)
    if n == 1
        fprintf('Move disk 1 from %s to %s\n', from, to);
        return;
    end
    tower_of_hanoi(n - 1, from, aux, to);
    fprintf('Move disk %d from %s to %s\n', n, from, to);
    tower_of_hanoi(n - 1, aux, to, from);
end
