% Function F(x) = x^3 - 60x^2 + 900x + 100
F = @(x) x.^3 - 60*x.^2 + 900*x + 100;

% Chromosomes
chromosomes = ['11100'; '01111'; '10111'; '00100'];
xValues = bin2dec(chromosomes);
fitnessValues = F(xValues);

disp('X and Fitness Values:');
disp([xValues', fitnessValues']);

% Perform crossovers
parent1 = chromosomes(3, :); % P3
parent2 = chromosomes(2, :); % P2
crossoverPoint = 1;
offspring1 = [parent1(1:crossoverPoint), parent2(crossoverPoint+1:end)];
offspring2 = [parent2(1:crossoverPoint), parent1(crossoverPoint+1:end)];

disp('Offspring C1 and C2:');
disp(offspring1);
disp(offspring2);
