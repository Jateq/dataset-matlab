% Define the Rosenbrock function, its gradient, and Hessian
f_rosenbrock = @(x) 100 * (x(2) - x(1)^2)^2 + (1 - x(1))^2;
grad_rosenbrock = @(x) [-400 * x(1) * (x(2) - x(1)^2) - 2 * (1 - x(1)); 
                         200 * (x(2) - x(1)^2)];
hessian_rosenbrock = @(x) [1200 * x(1)^2 - 400 * x(2) + 2, -400 * x(1); 
                           -400 * x(1), 200];

% Initial point, tolerance, and maximum iterations
x = [-1.2; 1.0];
tol = 1e-6;
max_iter = 1000;

% Store the path
x_values = x;

% Newton's Method for Rosenbrock function
for k = 1:max_iter
    grad = grad_rosenbrock(x);
    if norm(grad) < tol
        break;
    end
    
    % Calculate Hessian and the descent direction
    H = hessian_rosenbrock(x);
    
    % Ensure Hessian is positive definite
    if min(eig(H)) <= 0
        H = H + eye(2) * 1e-4;
    end
    
    d = -H \ grad; % Equivalent to d = -inv(H) * grad
    
    % Line search to find optimal step size
    alpha = fminbnd(@(a) f_rosenbrock(x + a * d), 0, 1);
    
    % Update x
    x = x + alpha * d;
    x_values = [x_values, x];
end

% Convert x_values to a 2-row matrix for easy plotting
x1_vals = x_values(1, :);
x2_vals = x_values(2, :);

% Plot contours of f(x)
x1 = linspace(-1.5, 1.5, 200); % Higher resolution for smooth contours
x2 = linspace(-1, 2, 200);
[X1, X2] = meshgrid(x1, x2);
F = arrayfun(@(x1, x2) f_rosenbrock([x1; x2]), X1, X2);

figure;
contourf(X1, X2, F, 50, 'LineColor', 'none'); % Filled contours for better visualization
colormap(jet); % Use jet color map for gradient effect
colorbar; % Show color bar for reference
hold on;
plot(x1_vals, x2_vals, '-o', 'Color', 'r', 'LineWidth', 1.5); % Solution path
plot(1, 1, 'ko', 'MarkerSize', 8, 'MarkerFaceColor', 'k'); % Minimum point (1, 1)
xlabel('x_1');
ylabel('x_2');
title('Example 3.9 - Solution Path for Minimizing Rosenbrock Function');
legend('Rosenbrock Function', 'Newton’s Method Path', 'Global Minimum', 'Location', 'northwest');
grid on;
hold off;
