
% data = h5read('data/M03/OP13/good/M03_Feb_2021_OP13_002.h5', '/vibration_data');
data = dataset;

data_subset = data(:, 1:100);  


X_1 = data_subset(1, :)';  
X_2 = data_subset(2, :)';  
Y = data_subset(3, :)';    


X = [X_1, X_2]; 


figure;
scatter3(X(:, 1), X(:, 2), Y, 'filled');
xlabel('X_1 (First Feature)');
ylabel('X_2 (Second Feature)');
zlabel('Y (Target Variable)');
title('3D Scatter Plot of Original Features vs Y');
grid on;


x = randn(100, 6);  
x(:, [3, 4]) = X;   
y = species(1:100, :);  


myfun = @(XTrain, yTrain, XTest, yTest) ...
    size(XTest, 1) * loss(fitcecoc(XTrain, yTrain), XTest, yTest);


cv = cvpartition(y, "KFold", 10);
opts = statset("Display", "iter");


tf_forward = sequentialfs(myfun, x, y, "CV", cv, "Options", opts);
selected_features_forward = find(tf_forward);
disp("Selected Features (Forward Selection): ");
disp(selected_features_forward);


X_selected_forward = X(selected_features_forward, :);
Y_selected_forward = Y(1:length(X_selected_forward));


figure;
scatter3(X_selected_forward(1, :), X_selected_forward(2, :), Y_selected_forward, 'filled');
xlabel('X_1 (Selected Feature 1)');
ylabel('X_2 (Selected Feature 2)');
zlabel('Y (Target Variable)');
title('3D Scatter Plot of Selected Features (Forward Selection)');
grid on;


tf_backward = sequentialfs(myfun, x, y, "CV", cv, "Direction", "backward", "Options", opts);
selected_features_backward = find(tf_backward);
disp("Selected Features (Backward Selection): ");
disp(selected_features_backward);
