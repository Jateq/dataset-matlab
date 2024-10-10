% Assuming you already have training images and labels loaded
% Reshape the training data (as before)
X_train = reshape(training.images, [], training.count)'; % each row is an image (784 dimensions)
Y_train = training.labels;

% Apply PCA to reduce the data to 3 dimensions for visualization
[coeff, X_train_pca, ~] = pca(X_train, 'NumComponents', 3);

% Train a k-NN classifier on the 3 principal components
k = 5;
Mdl = fitcknn(X_train_pca, Y_train, 'NumNeighbors', k);

% Create a 3D scatter plot of the first three principal components
figure;
scatter3(X_train_pca(:, 1), X_train_pca(:, 2), X_train_pca(:, 3), 10, Y_train, 'filled');
title('3D Visualization of MNIST Data (First 3 Principal Components)');
xlabel('Principal Component 1');
ylabel('Principal Component 2');
zlabel('Principal Component 3');
colorbar;
hold on;

% Now, plot the decision boundaries
% Create a grid of points spanning the 3D space of the principal components
[X1, X2, X3] = meshgrid(linspace(min(X_train_pca(:,1)), max(X_train_pca(:,1)), 30), ...
                        linspace(min(X_train_pca(:,2)), max(X_train_pca(:,2)), 30), ...
                        linspace(min(X_train_pca(:,3)), max(X_train_pca(:,3)), 30));

% Predict labels on the grid of points
gridPoints = [X1(:) X2(:) X3(:)];
predGrid = predict(Mdl, gridPoints);

% Reshape the predictions to fit the grid dimensions
predGrid = reshape(predGrid, size(X1));

% Visualize decision boundaries with an isosurface plot
isosurface(X1, X2, X3, predGrid, 0.5);  % Choose an appropriate threshold for class separation
hold off;
