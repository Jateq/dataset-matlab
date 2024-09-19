
ageAtEnrollment = updateddataset(:, 20);
admissionGrade = updateddataset(:, 13);
outcome = updateddataset(:, end);  


outcome = outcome + 0.1*randn(size(outcome));


[xGrid, yGrid] = meshgrid(linspace(min(ageAtEnrollment), max(ageAtEnrollment), 50), ...
                          linspace(min(admissionGrade), max(admissionGrade), 50));


zGrid = griddata(ageAtEnrollment, admissionGrade, outcome, xGrid, yGrid, 'cubic');


figure;
surf(xGrid, yGrid, zGrid);
xlabel('Age at Enrollment');
ylabel('Admission Grade');
zlabel('Outcome (1=Dropout, 2=Graduated, 3=Enrolled)');
title('3D Surface Plot of Admission Grade, Age, and Predicted Outcome');
colorbar; 
grid on;
