Y_pred = predict(Mdl, X_test);

% Generate a confusion matrix
figure;
confusionchart(test.labels, Y_pred);
title('Confusion Matrix');