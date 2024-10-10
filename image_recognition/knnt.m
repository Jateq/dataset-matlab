% Assuming you have already loaded the MNIST training and test data
% trainImages, trainLabels, testImages, testLabels are your datasets

% Reshape the data: Convert the 2D image matrices into 1D vectors
X_train = reshape(training.images, [], training.count)';
X_test = reshape(test.images, [], test.count)';

% Train k-NN classifier
k = 5;  % You can change the value of 'k' to experiment with different neighbors
Mdl = fitcknn(X_train, training.labels, 'NumNeighbors', k);

% Test the classifier on the test data
predictedLabels = predict(Mdl, X_test);

% Calculate accuracy
accuracy = sum(predictedLabels == test.labels) / length(test.labels);
fprintf('Test Accuracy: %.2f%%\n', accuracy * 100);

% Visualize a random test image and its predicted label
randomIdx = randi(test.count);
figure;
imshow(reshape(X_test(randomIdx, :), test.height, test.width));
title(['Predicted Label: ', num2str(predictedLabels(randomIdx))]);

