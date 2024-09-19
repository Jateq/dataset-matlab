% Extract the admission grade and outcome columns
admissionGrade = updateddataset(:, 13); 
scholarshipHolder = updateddataset(:, 19); 
target = updateddataset(:, end);

% Filter students who are scholarship holders
scholarshipGrades = admissionGrade(scholarshipHolder == 1); 
scholarshipOutcomes = target(scholarshipHolder == 1);

% Create a box plot of admission grade by outcome
figure;
boxplot(scholarshipGrades, scholarshipOutcomes, 'Labels', {'Dropout', 'Graduated', 'Enrolled'});
xlabel('Outcome');
ylabel('Admission Grade');
title('Admission Grade Distribution for Scholarship Holders by Outcome');
grid on;
