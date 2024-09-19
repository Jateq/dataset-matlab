% Extract the admission grade
admissionGrade = updateddataset(:, 13);

% Create a histogram of admission grades
figure;
histogram(admissionGrade, 20); % 20 bins
xlabel('Admission Grade');
ylabel('Number of Students');
title('Distribution of Admission Grades');
grid on;
