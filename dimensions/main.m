marital_status = data.MaritalStatus;
course = data.AdmissionGrade;
gender = data.Gender;
target = data.Target; % The target or another measure to aggregate

[marital_idx, ~] = grp2idx(marital_status);
[course_idx, ~] = grp2idx(course);
[gender_idx, ~] = grp2idx(gender);

% Aggregating the target data based on categories
cube = accumarray([marital_idx, course_idx, gender_idx], target, [], @mean);

disp(cube); % Display the data cube

[X, Y, Z] = ndgrid(1:size(cube,1), 1:size(cube,2), 1:size(cube,3)); % Create grid

% Flatten the cube and grid to vectors for plotting
X = X(:);
Y = Y(:);
Z = Z(:);
V = cube(:); % Aggregated target values

% Filter out NaN or zero values
validIdx = ~isnan(V) & V ~= 0;
X = X(validIdx);
Y = Y(validIdx);
Z = Z(validIdx);
V = V(validIdx);

% Create a 3D scatter plot
scatter3(X, Y, Z, 100, V, 'filled');
colorbar; % Add color bar to show the magnitude of the values
xlabel('Marital Status');
ylabel('Admission grade');
zlabel('Gender');
title('3D Data Cube Visualization');
