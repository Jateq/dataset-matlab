% Read data from the correct dataset
data = h5read(h5FilePath, '/vibration_data');

% Ensure the data is numeric and convert to double
data = double(data);  % Convert to double explicitly

% Check if data is numeric
if isnumeric(data)
    % Display data size and first few elements for inspection
    disp(['Data size: ', num2str(size(data))]);
    disp(data(1:min(10, numel(data))));

    % Check if the data length is sufficient
    if size(data, 2) >= 10  % Ensure there are at least 10 columns
        % Extract features
        features = [mean(data, 2), std(data, 0, 2), skewness(data, 0, 2), kurtosis(data, 0, 2)];
        allData = [allData; features.'];  % Append features for each file
    else
        fprintf('Insufficient data length in file: %s\n', h5FileName);
    end
else
    fprintf('Non-numeric data in file: %s\n', h5FileName);
end
