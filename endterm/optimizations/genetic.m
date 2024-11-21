
objectiveFunction = @(theta) computeCost(theta, data);

% Number of variables (parameters to optimize: ENGINE_SIZE and FUEL_CONSUMPTION)
numVariables = 2;

% Define bounds for the variables (normalized range: -1 to 1)
lb = -1 * ones(1, numVariables); % Lower bound
ub = 1 * ones(1, numVariables);  % Upper bound

% Set Genetic Algorithm options
options = optimoptions('ga', ...
    'PopulationSize', 50, ...       % Number of candidates in each generation
    'MaxGenerations', 100, ...     % Maximum number of generations
    'Display', 'iter', ...         % Display progress at each iteration
    'PlotFcn', {@gaplotbestf});    % Plot the best fitness function value

% Run the Genetic Algorithm
[bestTheta, bestCost] = ga(objectiveFunction, numVariables, [], [], [], [], lb, ub, [], options);

% Display Results
disp('Optimized Parameters (Theta):');
disp(bestTheta);
disp('Best Cost (Minimized CO2 Emissions):');
disp(bestCost);

function cost = computeCost(theta, data)
    % Extract features and target variable
    X = table2array(data(:, {'ENGINE_SIZE', 'FUEL_CONSUMPTION*'}));
    y = data.CO2_EMISSIONS;

    % Normalize data
    X = normalize(X);
    y = normalize(y);

    % Predicted CO2 Emissions
    y_pred = X * theta(:);

    % Mean Squared Error as the cost function
    cost = mean((y_pred - y) .^ 2);
end
