% Given parents and template
parent1 = [1, 2, 3, 4, 5, 6, 7, 8];
parent2 = [8, 7, 6, 5, 4, 3, 2, 1];
template = [1, 0, 1, 0, 1, 0, 1, 0]; % 1: inherit from parent1, 0: from parent2

%% Uniform Crossover
offspring1 = zeros(1, length(template));
offspring2 = zeros(1, length(template));
for i = 1:length(template)
    if template(i) == 1
        offspring1(i) = parent1(i);
        offspring2(i) = parent2(i);
    else
        offspring1(i) = parent2(i);
        offspring2(i) = parent1(i);
    end
end

disp('Uniform Crossover Offspring:');
disp(offspring1);
disp(offspring2);

%% Order-Based Crossover
% Preserving the order from parent1, fill remaining elements from parent2
offspring3 = zeros(1, length(parent1));
offspring4 = zeros(1, length(parent2));

% For Offspring3
filled_positions = template == 1; % Positions to fill from parent1
offspring3(filled_positions) = parent1(filled_positions);
remaining = setdiff(parent2, offspring3(filled_positions), 'stable'); % Remaining elements from parent2
offspring3(~filled_positions) = remaining;

% For Offspring4
filled_positions = template == 0; % Positions to fill from parent2
offspring4(filled_positions) = parent2(filled_positions);
remaining = setdiff(parent1, offspring4(filled_positions), 'stable'); % Remaining elements from parent1
offspring4(~filled_positions) = remaining;

disp('Order-Based Crossover Offspring:');
disp(offspring3);
disp(offspring4);
