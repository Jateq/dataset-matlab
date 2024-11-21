
features = table2array(data(:, {'ENGINE_SIZE', 'FUEL_CONSUMPTION*', 'CO2_EMISSIONS'}));

features_normalized = normalize(features);

num_clusters = 3; 
[cluster_indices, cluster_centers] = kmeans(features_normalized, num_clusters);


data.Cluster = cluster_indices;

figure;
gscatter(features(:, 1), features(:, 2), cluster_indices);
xlabel('Engine Size (L)');
ylabel('Fuel Consumption (L/100 km)');
title('K-Means Clustering of Vehicles');
legend('Cluster 1', 'Cluster 2', 'Cluster 3');

disp('Cluster Centers:');
disp(cluster_centers);
