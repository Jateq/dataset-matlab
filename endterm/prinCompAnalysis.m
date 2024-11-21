features = table2array(data(:, {'ENGINE_SIZE', 'FUEL_CONSUMPTION*', 'CO2_EMISSIONS'}));

features_normalized = normalize(features);

% Perform PCA
[coeff, score, explained] = pca(features_normalized);

disp('Explained Variance by Principal Components:');
disp(explained);


figure;
pareto(explained);
xlabel('Principal Component');
ylabel('Variance Explained (%)');
title('Explained Variance by Principal Components');

% Scatter plot of first two principal components
figure;
scatter(score(:, 1), score(:, 2));
xlabel('Principal Component 1');
ylabel('Principal Component 2');
title('PCA: First Two Principal Components');
grid on;

gscatter(score(:, 1), score(:, 2), data.Cluster); % Uncomment if clustering was done
