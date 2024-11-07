% Define the function, its gradient, and Hessian
f = @(x) 1 - exp(-(10*x(1)^2 + x(2)^2));
grad_f = @(x) [20 * x(1) * exp(-(10*x(1)^2 + x(2)^2)); 
               2 * x(2) * exp(-(10*x(1)^2 + x(2)^2))];
hessian_f = @(x) [20 * (1 - 20 * x(1)^2) * exp(-(10*x(1)^2 + x(2)^2)), -40 * x(1) * x(2) * exp(-(10*x(1)^2 + x(2)^2));
                  -40 * x(1) * x(2) * exp(-(10*x(1)^2 + x(2)^2)), 2 * (1 - 2 * x(2)^2) * exp(-(10*x(1)^2 + x(2)^2))];

% Initial point, tolerance, and maximum iterations
x = [-0.1; 0.6];
tol = 1e-6;
max_iter = 1000;

% Store the path
x_values = x;

% Newton's Method
for k = 1:max_iter
    grad = grad_f(x);
    if norm(grad) < tol
        break;
    end
    
    % Calculate Hessian and the descent direction
    H = hessian_f(x);
    d = -H \ grad; % Equivalent to d = -inv(H) * grad
    
    % Line search to find optimal step size
    alpha = fminbnd(@(a) f(x + a * d), 0, 1);
    
    % Update x
    x = x + alpha * d;
    x_values = [x_values, x];
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
title('Example 3.7 - Solution Path of Newton’s Method');
legend('f(x)', 'Newton’s Method Path', 'Minimum', 'Location', 'northwest');
colorbar;
grid on;
hold off;
