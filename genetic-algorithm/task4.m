% Binary strings
chromosomes = ['10100000'; '10101100'; '10101110'; '10101010'; 
               '11101010'; '11001010'; '00111010'; '10111010'];

% Fitness: Sum of positions of 1s
fitnessValues = zeros(1, size(chromosomes, 1));
for i = 1:size(chromosomes, 1)
    positions = find(chromosomes(i, :) == '1');
    fitnessValues(i) = sum(positions);
end

disp('Fitness Values:');
disp(fitnessValues);

% Roulette Wheel
P = fitnessValues / sum(fitnessValues);
cumulativeP = cumsum(P);
disp('Cumulative Probabilities:');
disp(cumulativeP);

% Select individuals for mating pool
randomNumbers = [0.42, 0.61, 0.81, 0.002, 0.95];
matingPool = cell(1, length(randomNumbers));
for i = 1:length(randomNumbers)
    matingPool{i} = chromosomes(find(cumulativeP >= randomNumbers(i), 1), :);
end
disp('Mating Pool:');
disp(matingPool);
