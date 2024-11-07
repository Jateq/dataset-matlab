% Define the function and its gradient
f = @(x) 1 - exp(-(10*x(1)^2 + x(2)^2));
grad_f = @(x) [20 * x(1) * exp(-(10*x(1)^2 + x(2)^2)); 
               2 * x(2) * exp(-(10*x(1)^2 + x(2)^2))];

% Initial point, tolerance, and maximum iterations
x = [-0.1; 0.6];
tol = 1e-6;
max_iter = 1000;

% Store the path
x_values = x;

% Initialize gradient and direction for Conjugate Gradient method
grad = grad_f(x);
d = -grad;

% Conjugate Gradient Algorithm
for k = 1:max_iter
    if norm(grad) < tol
        break;
    end
    
    % Line search to find optimal step size
    alpha = fminbnd(@(a) f(x + a * d), 0, 1);
    
    % Update x
    x = x + alpha * d;
    x_values = [x_values, x];
    
    % Update gradient and calculate beta
    grad_new = grad_f(x);
    beta = (grad_new' * grad_new) / (grad' * grad);
    
    % Update direction
    d = -grad_new + beta * d;
    
    % Update the gradient
    grad = grad_new;
end

% Convert x_values to a 2-row matrix for easy plotting
x1_vals = x_values(1, :);
x2_vals = x_values(2, :);

% Plot contours of f(x)
x1 = linspace(-0.25, 0.25, 100);
x2 = linspace(-0.7, 0.7, 100);
[X1, X2] = meshgrid(x1, x2);
F = arrayfun(@(x1, x2) f([x1; x2]), X1, X2);

figure;
contour(X1, X2, F, 20); % Plot 20 contour levels
hold on;
plot(x1_vals, x2_vals, '-o', 'Color', 'r', 'LineWidth', 1.5); % Solution path
plot(0, 0, 'ko', 'MarkerSize', 8, 'MarkerFaceColor', 'k'); % Minimum point
xlabel('x_1');
ylabel('x_2');
title('Example 3.6 - Solution Path of Conjugate Gradient Method');
legend('f(x)', 'Conjugate Gradient Path', 'Minimum', 'Location', 'northwest');
colorbar;
grid on;
hold off;