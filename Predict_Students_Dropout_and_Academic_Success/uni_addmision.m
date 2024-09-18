% Extract Admission grade and Target columns
admissionGrade = updateddataset(:, 13); % Assuming Admission grade is in the 13th column
targetColumn = updateddataset(:, end); % Target column

% Create a box plot of Admission grade by Target
figure;
boxplot(admissionGrade, targetColumn, 'Labels', {'Dropout', 'Graduated', 'Enrolled'});
xlabel('Graduation Status');
ylabel('Admission Grade');
title('Box Plot of Admission Grade by Graduation Status');
grid on;
