X = table2array(data(:, {'ENGINE_SIZE', 'FUEL_CONSUMPTION*'}));
y = data.CO2_EMISSIONS;

X = normalize(X);
y = normalize(y);

[m, n] = size(X);
theta = zeros(n + 1, 1); 
alpha = 0.01; 
iterations = 1000; 

X = [ones(m, 1), X]; 

J_history = zeros(iterations, 1);

for i = 1:iterations
    h = X * theta;
    J = (1 / (2 * m)) * sum((h - y) .^ 2);
    J_history(i) = J;
    gradient = (1 / m) * (X' * (h - y));
    theta = theta - alpha * gradient;
end

disp('Optimized Parameters (Theta):');
disp(theta);

figure;
plot(1:iterations, J_history);
xlabel('Iteration');
ylabel('Cost Function (J)');
title('Gradient Descent: Cost Function Convergence');

% Predicted CO2 Emissions
y_pred = X * theta;

% Scatter plot of actual vs. predicted values
figure;
scatter(y, y_pred);
xlabel('Actual CO2 Emissions (Normalized)');
ylabel('Predicted CO2 Emissions (Normalized)');
title('Gradient Descent: Actual vs. Predicted CO2 Emissions');
grid on;
