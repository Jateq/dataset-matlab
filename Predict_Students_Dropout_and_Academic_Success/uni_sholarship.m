% Extract relevant columns
targetColumn = updateddataset(:, end); % Target column (Dropout, Graduated, Enrolled)
scholarshipHolder = updateddataset(:, 19); % Scholarship Holder column (1 or 0)

% Convert scholarshipHolder to categorical for labeling
scholarshipHolderCategorical = categorical(scholarshipHolder, [0, 1], {'No', 'Yes'});

% Unique target values and scholarship statuses
targetValues = unique(targetColumn);
scholarshipStatuses = unique(scholarshipHolderCategorical);

% Initialize counts matrix
counts = zeros(length(targetValues), length(scholarshipStatuses));

% Count occurrences of each target value for each scholarship status
for i = 1:length(scholarshipStatuses)
    for j = 1:length(targetValues)
        counts(j, i) = sum(targetColumn == targetValues(j) & scholarshipHolderCategorical == scholarshipStatuses(i));
    end
end

% Create a grouped bar chart
figure;
bar(counts, 'grouped');
set(gca, 'XTickLabel', targetValues);
xlabel('Graduation Status');
ylabel('Number of Students');
title('Number of Students by Graduation Status and Scholarship Status');
legend('No Scholarship', 'Has Scholarship');
grid on;
