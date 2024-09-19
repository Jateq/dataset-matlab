% Extract the Target column from your dataset (assuming it is updateddataset(:, end))
outcome = updateddataset(:, end); 

% Count the occurrences of each outcome
categories = {'Dropout', 'Graduated', 'Enrolled'};
outcomeCounts = histcounts(outcome, [1, 2, 3, 4]);

% Create bar chart
figure;
bar(outcomeCounts);
set(gca, 'xticklabel', categories);
xlabel('Student Outcomes');
ylabel('Number of Students');
title('Distribution of Student Outcomes');
grid on;
