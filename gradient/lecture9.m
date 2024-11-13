% --- Main Script ---

% Part 1: Minimizing f(x) with G(x)
disp('--- Minimizing f(x) ---');
x0 = [0; 0; 0];  % Initial guess for x
options = optimoptions('fminunc', 'Algorithm', 'quasi-newton', 'Display', 'iter');
[x_min, f_min] = fminunc(@f, x0, options);

% Display the results of minimization
fprintf('Optimal x: [%f, %f, %f]\n', x_min);
fprintf('Minimum value of f(x): %f\n', f_min);
disp('--- Minimization Complete ---');

% Part 2: Gradient Descent for Line Fitting

% Define the dataset for gradient descent
data = [3, 0; 6, -3; 4, -1; 5, -2];
X = data(:, 1);
y = data(:, 2);

% Gradient descent settings
alpha = 0.5;           % Initial learning rate
theta = [1; 2];        % Initial theta values [theta_0; theta_1]
num_iterations = 1000; % Maximum number of iterations
convergence_threshold = 1e-6;

% Add a column of ones to X for the intercept term (theta_0)
X = [ones(length(X), 1), X];
m = length(y);  % Number of training examples

% Gradient Descent Algorithm
disp('--- Starting Gradient Descent ---');
cost_history = zeros(num_iterations, 1);  % For storing cost at each iteration

for iter = 1:num_iterations
    % Calculate predictions and errors
    predictions = X * theta;
    errors = predictions - y;
    
    % Calculate gradient and update theta
    gradient = (1 / m) * (X' * errors);
    theta = theta - alpha * gradient;
    
    % Calculate and store the cost
    cost_history(iter) = computeCost(X, y, theta);
    
    % Check for convergence
    if iter > 1 && abs(cost_history(iter) - cost_history(iter - 1)) < convergence_threshold
        fprintf('Converged after %d iterations.\n', iter);
        break;
    end
end

% Display final parameters from gradient descent
fprintf('Final Theta_0: %f\n', theta(1));
fprintf('Final Theta_1: %f\n', theta(2));
disp('--- Gradient Descent Complete ---');

% --- Nested Functions ---
    function val = G(x)
        % Define G(x) as a vector function
        val = [
            3 * x(1) - cos(x(2) * x(3)) - 1.5;
            4 * x(1)^2 - 625 * x(2)^2 + 2 * x(2) - 1;
            exp(-x(1) * x(2)) + 20 * x(3) + 10 * pi - 3
        ];
    end

    function f_val = f(x)
        % Define f(x) which is 0.5 * (g1(x)^2 + g2(x)^2 + g3(x)^2)
        G_val = G(x);
        f_val = 0.5 * sum(G_val .^ 2);
    end

    function J = computeCost(X, y, theta)
        % Cost function J(theta) for line fitting
        m = length(y);
        predictions = X * theta;
        sq_errors = (predictions - y) .^ 2;
        J = 1 / (2 * m) * sum(sq_errors);
    end
