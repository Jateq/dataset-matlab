function score = evaluateModel(X, y)
    % Train and evaluate a simple KNN model
    cv = cvpartition(y, 'KFold', 5);  % 5-fold cross-validation
    knnModel = fitcknn(X, y, 'CVPartition', cv);
    score = kfoldLoss(knnModel);  % Return cross-validation loss as the score
end
