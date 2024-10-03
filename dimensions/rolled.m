% Roll-up by Gender (aggregating over Gender dimension)
rolled_up_cube = squeeze(mean(cube, 3)); % Aggregating across the Gender dimension (3rd dimension)

% Create grid for Marital Status (X) and Admission Grade (Y)
[X, Y] = ndgrid(1:size(rolled_up_cube, 1), 1:size(rolled_up_cube, 2));

% Flatten the rolled-up cube and grid for plotting
X = X(:);
Y = Y(:);
V = rolled_up_cube(:);

% Filter out NaN or zero values
validIdx = ~isnan(V) & V ~= 0;
X = X(validIdx);
Y = Y(validIdx);
V = V(validIdx);

% Create a 3D bar plot for the rolled-up data
figure;
scatter3(X, Y, V, 100, V, 'filled');
colorbar; % Add color bar to show the magnitude of the values
xlabel('Marital Status');
ylabel('Admission Grade');
zlabel('Aggregated Target Value');
title('3D Rolled-Up Data Cube (Aggregated Over Gender)');
