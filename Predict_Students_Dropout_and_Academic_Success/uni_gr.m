% Assuming your data matrix is in the 'data' variable, and the last column is the 'Target' column
targetColumn = updateddataset(:, end);  % Extract the Target column

% Count the occurrences of each target value
dropoutCount = sum(targetColumn == 1);  % Count of Dropouts
graduatedCount = sum(targetColumn == 2);  % Count of Graduated
enrolledCount = sum(targetColumn == 3);  % Count of Enrolled

% Create a bar graph to represent the counts
figure;
bar([dropoutCount, graduatedCount, enrolledCount]);

% Add labels and title
set(gca, 'XTickLabel', {'Dropout', 'Graduated', 'Enrolled'});  % Set the x-axis labels
xlabel('Student Status');
ylabel('Number of Students');
title('Number of Students by Status');

grid on;
