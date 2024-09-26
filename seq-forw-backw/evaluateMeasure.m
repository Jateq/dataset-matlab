function accuracy = evaluateMeasure(S, X, y)
    % S - selected features
    % X - full feature matrix
    % y - target variable

    if isempty(S)
        accuracy = 0;
        return;
    end
    
    % Train a KNN model using the selected features
    knnModel = fitcknn(X(:, S), y, 'NumNeighbors', 5);
    
    % Check if there are enough observations for cross-validation
    if size(X, 1) < 5  % Minimum number of samples for 5-fold CV
        accuracy = 1;  % Assume maximum accuracy if not enough data
        return;
    end
    
    % Perform cross-validation to estimate accuracy
    cvModel = crossval(knnModel);
    accuracy = 1 - kfoldLoss(cvModel);  % Calculate accuracy
end
