
data = readtable('student_data.csv'); 
features = data{:, {'STG', 'SCG', 'STR', 'LPR', 'PEG'}};

%% Distance calculation like in Andy's case

reference_point = [0.15, 0.1, 0.4, 0.3, 0.2];  
distances = sum((features - reference_point).^2, 2);  

%% Finding 10% Smallest Distances:

sorted_distances = sort(distances);
threshold = sorted_distances(floor(0.1 * length(distances)));
close_points = find(distances <= threshold);

%% K-means Clustering and Classification:

k = 2; 
[idx, centers] = kmeans(features, k);

nearest_clusters = idx(close_points);
predicted_class = mode(nearest_clusters);  

%% Visualization 

figure;
gscatter(features(:,1), features(:,2), idx);
hold on;
plot(centers(:,1), centers(:,2), 'kx', 'MarkerSize', 10, 'LineWidth', 2);
plot(reference_point(1), reference_point(2), 'ro', 'MarkerSize', 10);
title('Clustering and Classification');
xlabel('STG');
ylabel('SCG');
legend('Cluster 1', 'Cluster 2', 'Centers', 'Reference');
grid on;
hold off;
