% Initialize figure for the 3D plot
figure;

% Loop through the first three Marital Status values (1, 2, 3)
for marital_status_idx = 1:3
    % Extract the subcube for the current marital status
    subcube = cube(marital_status_idx, :, :);
    
    % Remove singleton dimensions
    subcube = squeeze(subcube);
    
    % Create a grid for Admission Grade (Y) and Gender (Z)
    [Y, Z] = ndgrid(1:size(subcube, 1), 1:size(subcube, 2)); 
    
    % Create a matrix of X values (representing the marital status)
    X = marital_status_idx * ones(size(Y));
    
    % Flatten the subcube for plotting
    V = subcube(:); % Aggregated values
    
    % Flatten the grid values
    X = X(:);
    Y = Y(:);
    Z = Z(:);
    
    % Filter out NaN or zero values
    validIdx = ~isnan(V) & V ~= 0;
    X = X(validIdx);
    Y = Y(validIdx);
    Z = Z(validIdx);
    V = V(validIdx);
    
    % Use different colors for each marital status in the scatter plot
    scatter3(X, Y, Z, 100, V, 'filled'); 
    hold on; % Keep the plot for the next marital status
end

% Add labels and title
colorbar; % Add color bar to show the magnitude of the values
xlabel('Marital Status');
ylabel('Admission Grade');
zlabel('Gender');
title('3D Dicing Visualization for First Three Marital Statuses');
