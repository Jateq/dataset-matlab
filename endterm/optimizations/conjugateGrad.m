X = table2array(data(:, {'ENGINE_SIZE', 'FUEL_CONSUMPTION*'}));
y = data.CO2_EMISSIONS;
X = normalize(X);
y = normalize(y);

[m, n] = size(X);
theta = zeros(n + 1, 1);
iterations = 1000;

X = [ones(m, 1), X];
J_history = zeros(iterations, 1);

r = -((1 / m) * X' * (X * theta - y));
p = r;

for i = 1:iterations
    h = X * theta;
    J = (1 / (2 * m)) * sum((h - y) .^ 2);
    J_history(i) = J;
    
    alpha = (r' * r) / (p' * X' * X * p + eps); 
    theta = theta + alpha * p;
    r_new = r - alpha * (X' * X * p);
    beta = (r_new' * r_new) / (r' * r + eps); 
    p = r_new + beta * p;
    r = r_new;
end

disp('Optimized Parameters (Theta):');
disp(theta);

figure;
plot(1:iterations, J_history);
xlabel('Iteration');
ylabel('Cost Function (J)');
title('Conjugate Gradient: Cost Function Convergence');

y_pred = X * theta;

figure;
scatter(y, y_pred);
xlabel('Actual CO2 Emissions (Normalized)');
ylabel('Predicted CO2 Emissions (Normalized)');
title('Conjugate Gradient: Actual vs. Predicted CO2 Emissions');
grid on;
