% Binary strings and fitness function
chromosomes = ['1100'; '0100'; '0001'; '1110'; '0111'; '1001'];
fitnessFunction = @(x) 15 * x - x^2;

% Compute fitness
fitnessValues = zeros(1, size(chromosomes, 1));
for i = 1:size(chromosomes, 1)
    x = bin2dec(chromosomes(i, :));
    fitnessValues(i) = fitnessFunction(x);
end

disp('Fitness Values:');
disp(fitnessValues);

% Perform crossover at position 3 (6th and 2nd)
parent1 = chromosomes(6, :);
parent2 = chromosomes(2, :);
crossoverPoint = 3;
offspring1 = [parent1(1:crossoverPoint), parent2(crossoverPoint+1:end)];
offspring2 = [parent2(1:crossoverPoint), parent1(crossoverPoint+1:end)];
disp('Offspring after crossover:');
disp(offspring1);
disp(offspring2);

% Perform mutation on 1st and 5th chromosomes at positions 2 and 3
chromosomes(1, 2:3) = char(bitxor(bin2dec(chromosomes(1, 2:3)), 1) + '0');
chromosomes(5, 2:3) = char(bitxor(bin2dec(chromosomes(5, 2:3)), 1) + '0');
disp('After mutation:');
disp(chromosomes);
