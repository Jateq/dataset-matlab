X1 = [6 5 4 1 3 5 3 2]; 
X2 = [8 7 1 2 6 6 0 1]; 
X3 = [2 3 9 2 1 2 8 5]; 
X4 = [4 1 8 5 2 0 9 4]; 
 
fitness = @(x) (x(1) + x(2)) - (x(3) + x(4)) + (x(5) + x(6)) - (x(7) + x(8)); 
 
F1 = fitness(X1); 
F2 = fitness(X2); 
F3 = fitness(X3); 
F4 = fitness(X4); 
 
population = {X1, X2, X3, X4}; 
fitness_values = [F1, F2, F3, F4]; 
 
% Sort individuals by fitness (descending) 
[sorted_fitness, idx] = sort(fitness_values, 'descend'); sorted_population = population(idx); 
 
% Display sorted individuals and fitness 
disp('Sorted Population and Fitness:'); 
for i = 1:length(sorted_population) 
    fprintf('Individual %d: %s, Fitness: %d\n', i, mat2str(sorted_population{i}), sorted_fitness(i)); 
end 
 
% Perform one-point crossover between the fittest two individuals 
parent1 = sorted_population{1}; 
parent2 = sorted_population{2}; 
crossover_point = 4; 
child1 = [parent1(1:crossover_point), parent2(crossover_point+1:end)]; 
child2 = [parent2(1:crossover_point), parent1(crossover_point+1:end)]; 
 
disp('One-point Crossover Results:'); 
fprintf('Child 1: %s\n', mat2str(child1)); fprintf('Child 2: %s\n', mat2str(child2)); 
 
% Perform two-point crossover between second and third fittest individuals 
parent3 = sorted_population{3}; 
crossover_points = [2, 6]; 
child3 	= 	[parent2(1:crossover_points(1)), parent3(crossover_points(1)+1:crossover_points(2)), parent2(crossover_points(2)+1:end)]; 
	child4 	= 	[parent3(1:crossover_points(1)), 
parent2(crossover_points(1)+1:crossover_points(2)), parent3(crossover_points(2)+1:end)]; 
 
disp('Two-point Crossover Results:'); fprintf('Child 3: %s\n', mat2str(child3)); fprintf('Child 4: %s\n', mat2str(child4)); 
 
