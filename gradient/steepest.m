
f = @(x) 1 - exp(-(10*x(1)^2 + x(2)^2));
grad_f = @(x) [20 * x(1) * exp(-(10*x(1)^2 + x(2)^2)); 
               2 * x(2) * exp(-(10*x(1)^2 + x(2)^2))];

x = [-0.1; 0.6];
tol = 1e-6;
alpha = 0.1;
max_iter = 1000;

x_values = x;

for k = 1:max_iter
    grad = grad_f(x);
    if norm(grad) < tol
        break;
    end
    x = x - alpha * grad;
    x_values = [x_values, x];
end

x1_vals = x_values(1, :);
x2_vals = x_values(2, :);

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
title('Example 3.5 - Solution Path of Steepest Descent Method');
legend('f(x)', 'Steepest Descent Path', 'Minimum', 'Location', 'northwest');
colorbar;
grid on;
hold off;
