% Given binary strings
chromosomes = ['10100000'; '10101100'; '10101110'; '10101010'; 
               '11101010'; '11001010'; '00111010'; '10111010'];

% Fitness function for symmetry
fitnessFunction = @(x) length(x) - sum(x(1:length(x)/2) ~= x(length(x):-1:length(x)/2 + 1));

% Evaluate fitness
fitnessValues = zeros(1, size(chromosomes, 1));
for i = 1:size(chromosomes, 1)
    binaryArray = chromosomes(i, :) - '0'; % Convert string to binary array
    fitnessValues(i) = fitnessFunction(binaryArray);
end

disp('Fitness Values for Symmetry:');
disp(fitnessValues);

% Roulette Wheel Selection
P = fitnessValues / sum(fitnessValues); % Probabilities
cumulativeP = cumsum(P); % Cumulative probabilities

% Random numbers for selection
randomNumbers = [0.42, 0.61, 0.81, 0.002, 0.95];
matingPool = cell(1, length(randomNumbers));
for i = 1:length(randomNumbers)
    matingPool{i} = chromosomes(find(cumulativeP >= randomNumbers(i), 1), :);
end

disp('Mating Pool (Selected Strings):');
disp(matingPool);

% Perform crossover (one-point crossover at the midpoint)
parent1 = matingPool{1}; % Example: First two selected for crossover
parent2 = matingPool{2};
midpoint = floor(length(parent1) / 2);
offspring1 = [parent1(1:midpoint), parent2(midpoint+1:end)];
offspring2 = [parent2(1:midpoint), parent1(midpoint+1:end)];

disp('Offspring After Crossover:');
disp(offspring1);
disp(offspring2);

% Perform mutation (random position)
mutationRate = 0.1; % Probability of mutation
for i = 1:length(offspring1)
    if rand < mutationRate
        offspring1(i) = char(bitxor(str2double(offspring1(i)), 1) + '0');
    end
    if rand < mutationRate
        offspring2(i) = char(bitxor(str2double(offspring2(i)), 1) + '0');
    end
end

disp('Offspring After Mutation:');
disp(offspring1);
disp(offspring2);
