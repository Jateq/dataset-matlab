s = (1:length(trimmedData(:, 1)))./100; % time

figure;
plot(s, trimmedData(:, 1)); 
grid on 
xlabel('Student Index, с'); 
ylabel('Prediction, мВ'); 
title('Figure 2: Trimmed Data');
