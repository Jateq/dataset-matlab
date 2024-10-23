% Replace missing data with the column mean
data_cleaned = fillmissing(numeric_data, 'movmean', 1);

% Standardize the data
standardized_data_cleaned = zscore(data_cleaned);

% Perform PCA
[coeff, score, ~, ~, explained] = pca(standardized_data_cleaned);

% Plot the first two principal components
figure;
gscatter(score(:,1), score(:,2), target);
title('PCA with Missing Data Handled (Success/Dropout)');
xlabel('Principal Component 1');
ylabel('Principal Component 2');
legend('Success', 'Dropout');