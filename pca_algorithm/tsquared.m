% Perform PCA and get the T-squared statistic
[~, ~, ~, tsquared] = pca(standardized_data);

% Display the T-squared statistic
disp('T-Squared Statistic for each observation:');
disp(tsquared);

% Plot the T-squared statistic
figure;
scatter(1:length(tsquared), tsquared);
title('T-Squared Statistic (Success/Dropout)');
xlabel('Observations');
ylabel('T-Squared Value');
