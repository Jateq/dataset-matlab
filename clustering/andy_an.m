data = [80, 85; 70, 60; 50, 70; 90, 70; 85, 75];
andy = [70, 70];
data = [data; andy];

num_clusters = 2;
eta = 0.1;
num_iterations = 20;

centers = data(randperm(size(data, 1), num_clusters), :);

trajectories = cell(num_clusters, 1);
for i = 1:num_clusters
    trajectories{i} = centers(i, :);
end

for iter = 1:num_iterations
    for j = 1:size(data, 1)
        distances = sum((centers - data(j, :)).^2, 2);
        [~, k] = min(distances);
        centers(k, :) = centers(k, :) + eta * (data(j, :) - centers(k, :));
        trajectories{k} = [trajectories{k}; centers(k, :)];
    end
end

figure;
hold on;
plot(data(:, 1), data(:, 2), 'bo', 'MarkerSize', 8);
plot(andy(1), andy(2), 'rx', 'MarkerSize', 10, 'LineWidth', 2);

for i = 1:num_clusters
    traj = trajectories{i};
    plot(traj(:, 1), traj(:, 2), '-o', 'DisplayName', ['Center ' num2str(i)]);
end

xlabel('English Score');
ylabel('Math Score');
title('Trajectory of Centers in On-line K-means Clustering');
legend;
grid on;
hold off;

distances_to_centers = sum((centers - andy).^2, 2);
[~, andy_class] = min(distances_to_centers);
disp(['Andy is classified into Class ', num2str(andy_class)]);
