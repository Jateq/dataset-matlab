% Binary strings (initial population)
chromosomes = ['11000110'; '10101101'; '10011100'; '11100011'];

% Fitness function for symmetry
fitnessFunction = @(x) length(x) - sum(x(1:length(x)/2) ~= x(end:-1:length(x)/2 + 1));

% Calculate fitness for each chromosome
fitnessValues = zeros(1, size(chromosomes, 1));
for i = 1:size(chromosomes, 1)
    binaryArray = chromosomes(i, :) - '0'; % Convert string to binary array
    fitnessValues(i) = fitnessFunction(binaryArray);
end

disp('Fitness Values for Symmetry:');
disp(fitnessValues);

% Analyzing offspring of high-fitness parents
disp('Analyzing crossover:');
parent1 = chromosomes(1, :); % Select two high-fitness parents
parent2 = chromosomes(2, :);

% Perform one-point crossover
crossoverPoint = 4; % Midpoint
offspring1 = [parent1(1:crossoverPoint), parent2(crossoverPoint+1:end)];
offspring2 = [parent2(1:crossoverPoint), parent1(crossoverPoint+1:end)];

% Calculate fitness of offspring
offspringFitness1 = fitnessFunction(offspring1 - '0');
offspringFitness2 = fitnessFunction(offspring2 - '0');

disp('Offspring and their fitness:');
disp(['Offspring1: ', offspring1, ', Fitness: ', num2str(offspringFitness1)]);
disp(['Offspring2: ', offspring2, ', Fitness: ', num2str(offspringFitness2)]);
