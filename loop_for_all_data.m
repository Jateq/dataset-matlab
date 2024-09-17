% Define base directory for data
baseDir = 'data';

% List machines (M01, M02, M03)
machineFolders = dir(fullfile(baseDir, 'M*'));

% Iterate over each machine folder
for machineIdx = 1:length(machineFolders)
    machineName = machineFolders(machineIdx).name;
    
    % List operation process folders (OP00, OP01, etc.)
    processFolders = dir(fullfile(baseDir, machineName, 'OP*'));
    
    for processIdx = 1:length(processFolders)
        processName = processFolders(processIdx).name;
        
        % Path to the 'good' folder for the current machine and process
        goodFolderPath = fullfile(baseDir, machineName, processName, 'good');
        
        if exist(goodFolderPath, 'dir')
            % List all .h5 files in the 'good' folder
            h5Files = dir(fullfile(goodFolderPath, '*.h5'));
            
            for fileIdx = 1:length(h5Files)
                h5FileName = h5Files(fileIdx).name;
                h5FilePath = fullfile(goodFolderPath, h5FileName);
                
                % Display file being processed
                fprintf('Processing %s...\n', h5FilePath);
                
                % Load the .h5 file data
                data = h5read(h5FilePath, '/vibration_data');
                
                % Process the data (example: plot vibration on X-axis)
                % Vibration data axes: 1:X-axis, 2:Y-axis, 3:Z-axis
                t = (1:size(data, 1)) / 2000;  % Assuming 2kHz sampling rate             
            end
        else
            % 'good' folder does not exist for this operation process
            fprintf('No "good" folder for %s - %s\n', machineName, processName);
        end
    end
end