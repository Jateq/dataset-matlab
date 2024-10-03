slice_gender = cube(:, :, 1); % Extract the slice where Gender is 1
slice_gender = squeeze(slice_gender); % Remove singleton dimensions

% Create 2D scatter plot for Marital Status vs Admission Grade for Gender = 1
[X, Y] = ndgrid(1:size(slice_gender, 1), 1:size(slice_gender, 2)); % Grid for Marital Status and Admission Grade
V = slice_gender(:); % Flatten the slice

scatter(X(:), Y(:), 100, V, 'filled');
colorbar;
xlabel('Marital Status');
ylabel('Admission Grade');
title('Slice at Gender = 1');
