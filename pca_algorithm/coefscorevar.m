% Perform PCA
[coeff, score, latent, tsquared, explained] = pca(standardized_data);

% Display the principal component coefficients (loadings)
disp('Principal Component Coefficients:');
disp(coeff);

% Display the principal component scores
disp('Principal Component Scores:');
disp(score);

% Display the variance explained by each principal component
disp('Variance explained by each Principal Component:');
disp(latent);
