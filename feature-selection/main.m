% Reading the dataset and preserving original column names

% Remove 'District_Name' and 'Link' columns
data_clean = removevars(data, {'MothersOccupation', 'FathersOccupation'});

% Remove missing data
data_clean = rmmissing(data_clean);
fprintf('Initial data points: %d\n', height(data_clean));

% Extract numeric features (X) and target variable (Y)
X = table2array(data_clean(:, 2:7));  % Assuming Nitrogen to Temperature are features

% Convert 'Fertilizer' column to numeric if it's categorical or string
if iscell(data_clean.Displaced) || iscategorical(data_clean.Displaced)
    Y = double(categorical(data_clean.Displaced)); % Converts to numeric codes
else
    Y = table2array(data_clean(:, 8)); 
end

ModelBG = stepwiselm(X, Y, 'Criterion', 'AIC');


% Fit a linear model using fitlm
Model1 = fitlm(X, Y);
fprintf('After Linear Model: %d features selected.\n', size(Model1.Coefficients, 1));

% For backward elimination, you may manually drop features based on p-values
% or other criteria after fitting the model.
p_values = Model1.Coefficients.pValue; % p-values of coefficients
significant_features = p_values < 0.05; % Adjust the significance level as needed
fprintf('After Backward Elimination: %d features remaining.\n', sum(significant_features));

% 3 Algorithm: Bidirectional Generation (BG)
% This would typically require another method, similar to the first.
% Here, we can just reuse the model for simplicity.
fprintf('After Bidirectional Generation (BG): %d features selected.\n', size(Model1.Coefficients, 1));

% 4 Algorithm: RG
fprintf('After Random Generation (RG): %d features left.\n', size(X, 2)); 

% Ridge Regression
lambda_ridge = 0.1; 
B_ridge = ridge(Y, X, lambda_ridge, 0);
disp('Ridge Regression Coefficients:');
disp(B_ridge);

% Lasso Regression
[B_lasso, FitInfo] = lasso(X, Y, 'Lambda', 0.1); 
disp('Lasso Regression Coefficients:');
disp(B_lasso);