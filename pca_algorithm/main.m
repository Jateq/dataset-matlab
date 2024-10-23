% Load your dataset
data = readtable('data.csv');

% Extract numeric data and the target variable (success or dropout)
numeric_data = table2array(data(:, 1:end-1)); % All columns except the target
target = data.Target; % Assuming 'Target' is the name of the last column

% Standardize the data
standardized_data = zscore(numeric_data);

Compute PCA
[coeff, score, ~, ~, explained] = pca(standardized_data);

% Plot the first two principal components
figure;
gscatter(score(:,1), score(:,2), target);
title('Principal Components of the Student Data Set');
xlabel('Principal Component 1');
ylabel('Principal Component 2');
legend('Success', 'Dropout');
