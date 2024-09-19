
ageAtEnrollment = updateddataset(:, 20);
admissionGrade = updateddataset(:, 13);
outcome = updateddataset(:, end);


figure;
scatter3(ageAtEnrollment, admissionGrade, outcome, 50, outcome, 'filled');
xlabel('Age at Enrollment');
ylabel('Admission Grade');
zlabel('Outcome (1=Dropout, 2=Graduated, 3=Enrolled)');
title('3D Scatter Plot of Age, Admission Grade, and Outcome');
grid on;
