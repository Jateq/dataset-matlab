% Parameters
populationSize = 10;
stringLength = 5; % Binary length to represent 0 to 31
generations = 20;
mutationRate = 0.1;
fitnessFunction = @(x) x.^3 - 60*x.^2 + 900*x + 100;

% Initialize population
population = randi([0, 1], populationSize, stringLength);

for gen = 1:generations
    % Decode binary strings to integers
    decimalValues = bin2dec(num2str(population));
    fitnessValues = fitnessFunction(decimalValues);

    % Selection: Roulette Wheel
    probabilities = fitnessValues / sum(fitnessValues);
    cumulativeProb = cumsum(probabilities);
    selected = zeros(size(population));
    for i = 1:populationSize
        r = rand;
        selected(i, :) = population(find(cumulativeProb >= r, 1), :);
    end
    
    % Crossover: Single-point
    offspring = zeros(size(population));
    for i = 1:2:populationSize
        parent1 = selected(i, :);
        parent2 = selected(i+1, :);
        crossoverPoint = randi([1, stringLength-1]);
        offspring(i, :) = [parent1(1:crossoverPoint), parent2(crossoverPoint+1:end)];
        offspring(i+1, :) = [parent2(1:crossoverPoint), parent1(crossoverPoint+1:end)];
    end
    
    % Mutation
    for i = 1:numel(offspring)
        if rand < mutationRate
            offspring(i) = ~offspring(i);
        end
    end
    
    % Update population
    population = offspring;
end

% Decode final population and evaluate
finalDecimalValues = bin2dec(num2str(population));
finalFitnessValues = fitnessFunction(finalDecimalValues);

disp('Final Population and Fitness:');
disp([finalDecimalValues', finalFitnessValues']);
