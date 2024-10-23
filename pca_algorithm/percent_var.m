% Perform PCA
[~, ~, ~, ~, explained] = pca(standardized_data);

% Display the percentage of variance explained by each component
disp('Percent Variability Explained by Principal Components:');
disp(explained);

% Plot the explained variance
figure;
pareto(explained);
title('Variance Explained by Principal Components (Success/Dropout)');
xlabel('Principal Components');
ylabel('Percentage of Variance Explained');weights
