% Given chromosomes
X1 = [6, 5, 4, 1, 3, 5, 3, 2];
X2 = [8, 7, 1, 2, 6, 6, 0, 1];
X3 = [2, 3, 9, 2, 1, 2, 8, 5];
X4 = [4, 1, 8, 5, 2, 0, 9, 4];

% Fitness function
fitness = @(x) (x(1) + x(2)) - (x(3) + x(4)) + (x(5) + x(6)) - (x(7) + x(8));

% Calculate fitness
F = [fitness(X1), fitness(X2), fitness(X3), fitness(X4)];
disp('Fitness Values:');
disp(F);

% Sort by fitness (descending)
[sortedFitness, order] = sort(F, 'descend');
disp('Order of fitness (descending):');
disp(order);

% Perform one-point crossover at midpoint for fittest two individuals
parent1 = eval(['X' num2str(order(1))]);
parent2 = eval(['X' num2str(order(2))]);
midpoint = floor(length(parent1) / 2);
offspring1 = [parent1(1:midpoint), parent2(midpoint+1:end)];
offspring2 = [parent2(1:midpoint), parent1(midpoint+1:end)];
disp('Offspring after one-point crossover:');
disp(offspring1);
disp(offspring2);

% Perform two-point crossover (points b and f) for second and third fittest
parent3 = eval(['X' num2str(order(3))]);
point1 = 2; % index b
point2 = 6; % index f
offspring3 = [parent2(1:point1), parent3(point1+1:point2), parent2(point2+1:end)];
offspring4 = [parent3(1:point1), parent2(point1+1:point2), parent3(point2+1:end)];
disp('Offspring after two-point crossover:');
disp(offspring3);
disp(offspring4);
