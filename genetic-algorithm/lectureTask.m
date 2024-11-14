% Function to maximize
f = @(x) x^3 - 60 * x^2 + 900 * x + 100;

% Convert a binary string to a decimal number
binaryToDecimal = @(binStr) bin2dec(binStr);

% Convert a decimal number to a binary string with 5 bits
decimalToBinary = @(x) dec2bin(x, 5);

% Initial solution
x = 19; % initial decimal solution
x_bin = decimalToBinary(x); % binary representation of the solution
initial_f_x = f(x);

% Parameters
initial_temperature = 500;
cooling_factor = 0.9;
T_min = 1.0; % Minimum temperature threshold

% Initialize output headers
fprintf('%-10s %-10s %-10s %-10s %-10s %-10s %-10s\n', ...
    'T', 'Move', 'Solution', 'f', 'Δf', 'Move?', 'New Neighbor Solution');

% Run the simulated annealing process
T = initial_temperature; % Set initial temperature
best_x = x;
best_f_x = initial_f_x;
move_count = 0; % Initialize move counter

while T > T_min
    move_count = move_count + 1; % Increment move count

    % Generate a new solution by flipping a random bit
    rand_bit = randi(5); % Choose a random bit to flip
    new_x_bin = x_bin;
    new_x_bin(rand_bit) = num2str(1 - str2double(x_bin(rand_bit))); % Flip the chosen bit
    new_x = binaryToDecimal(new_x_bin); % Convert to decimal
    new_f_x = f(new_x); % Evaluate the function at the new solution

    % Calculate the change in function value
    delta_f = new_f_x - best_f_x;
    
    % Decide whether to accept the new solution
    if delta_f > 0 || (exp(delta_f / T) > rand)
        % Accept the new solution
        move = 'Yes';
        best_x = new_x;
        best_f_x = new_f_x;
        x_bin = new_x_bin;
    else
        move = 'No';
    end
    
    % Print the current iteration details
    fprintf('%-10.1f %-10d %-10s %-10.0f %-10.0f %-10s %-10s\n', ...
        T, move_count, x_bin, best_f_x, delta_f, move, new_x_bin);
    
    % Cool down the temperature
    T = cooling_factor * T;
end

% Display final result
fprintf('\nFinal solution: x = %d, f(x) = %.0f\n', best_x, best_f_x);
