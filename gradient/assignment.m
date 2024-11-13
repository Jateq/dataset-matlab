% Task 1: Implement Gradient Descent for Line Fitting

% Define the data points
X = [1; 3; 5]; % Feature (independent variable)
Y = [4.8; 12.4; 15.5]; % Target (dependent variable)

% Initialize parameters
w0 = 0; % Intercept
w1 = 0; % Slope
alpha = 0.01; % Learning rate
num_iterations = 100; % Number of iterations
m = length(Y); % Number of data points

for iter = 1:num_iterations
    % Predictions
    Y_pred = w0 + w1 * X;
    
    % Compute error terms
    errors = Y_pred - Y;
    
    % Gradient calculation for w0 and w1
    w0_gradient = (1 / m) * sum(errors);
    w1_gradient = (1 / m) * sum(errors .* X);
    
    % Update w0 and w1
    w0 = w0 - alpha * w0_gradient;
    w1 = w1 - alpha * w1_gradient;
end

fprintf('Optimized w0: %.4f\n', w0);
fprintf('Optimized w1: %.4f\n', w1);


% Task 2: Show Iterative Weight Calculation Examples

% Initialize parameters
w0 = 0; % Initial intercept
w1 = 0; % Initial slope
alpha = 0.01; % Learning rate

% Manually calculate and display weights for the first few iterations
for iter = 1:5
    % Predictions
    Y_pred = w0 + w1 * X;
    
    % Compute error terms
    errors = Y_pred - Y;
    
    % Gradient calculation
    w0_gradient = (1 / m) * sum(errors);
    w1_gradient = (1 / m) * sum(errors .* X);
    
    % Update w0 and w1
    w0 = w0 - alpha * w0_gradient;
    w1 = w1 - alpha * w1_gradient;
    
    % Display updated weights
    fprintf('Iteration %d - w0: %.4f, w1: %.4f\n', iter, w0, w1);
end

% Task 3: Plot Loss vs w0

% Set up range of values for w0
w0_values = linspace(-1, 1, 100); % Range for w0
fixed_w1 = w1; % Keep w1 fixed as the optimized slope from Task 1
loss_values = zeros(size(w0_values));

% Calculate the loss (MSE) for each w0 value
for i = 1:length(w0_values)
    Y_pred = w0_values(i) + fixed_w1 * X;
    errors = Y_pred - Y;
    loss_values(i) = (1 / (2 * m)) * sum(errors .^ 2);
end

% Plotting Loss vs w0
figure;
plot(w0_values, loss_values);
xlabel('w0');
ylabel('Loss (MSE)');
title('Loss vs w0');

% Task 4a: Plot Loss vs w1

% Set up range of values for w1
w1_values = linspace(-1, 3, 100); % Range for w1
fixed_w0 = w0; % Keep w0 fixed as the optimized intercept from Task 1
loss_values_w1 = zeros(size(w1_values));

% Calculate the loss (MSE) for each w1 value
for i = 1:length(w1_values)
    Y_pred = fixed_w0 + w1_values(i) * X;
    errors = Y_pred - Y;
    loss_values_w1(i) = (1 / (2 * m)) * sum(errors .^ 2);
end

% Plotting Loss vs w1
figure;
plot(w1_values, loss_values_w1);
xlabel('w1');
ylabel('Loss (MSE)');
title('Loss vs w1');

% Task 4b: 3D Plot of Loss w.r.t. w0 and w1

[w0_grid, w1_grid] = meshgrid(linspace(-1, 1, 50), linspace(-1, 3, 50));
loss_grid = zeros(size(w0_grid));

% Calculate loss for each pair of (w0, w1)
for i = 1:size(w0_grid, 1)
    for j = 1:size(w0_grid, 2)
        Y_pred = w0_grid(i, j) + w1_grid(i, j) * X;
        errors = Y_pred - Y;
        loss_grid(i, j) = (1 / (2 * m)) * sum(errors .^ 2);
    end
end

% 3D Surface Plot
figure;
surf(w0_grid, w1_grid, loss_grid);
xlabel('w0');
ylabel('w1');
zlabel('Loss (MSE)');
title('3D plot of Loss function with respect to w0 and w1');
