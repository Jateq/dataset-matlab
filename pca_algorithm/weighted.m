% Define weights for each variable (for example, higher weight for the first 3 variables)
weights = ones(1, size(standardized_data, 2)); 
weights(1:3) = 2; % Increase weight for the first 3 variables

% Apply weights to the standardized data
weighted_data = standardized_data .* weights;

% Perform PCA on weighted data
[coeff, score, ~, ~, explained] = pca(weighted_data);

% Plot the first two principal components
figure;
gscatter(score(:,1), score(:,2), target);
title('Weighted PCA (Success/Dropout)');
xlabel('Principal Component 1');
ylabel('Principal Component 2');
legend('Success', 'Dropout');
