t = (1:length(data(:, 1)))./100; % time

figure;
plot(t, data(:, 1)); 
grid on 
xlabel('Student Index, с'); 
ylabel('Prediction, мВ'); 
title('Figure 1: Full Data');
