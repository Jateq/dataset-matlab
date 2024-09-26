
baseDir = 'data';

% List machines (M01, M02, M03)
machineFolders = dir(fullfile(baseDir, 'M*'));


for machineIdx = 1:length(machineFolders)
    machineName = machineFolders(machineIdx).name;
    processFolders = dir(fullfile(baseDir, machineName, 'OP*'));
    for processIdx = 1:length(processFolders)
        processName = processFolders(processIdx).name;
        goodFolderPath = fullfile(baseDir, machineName, processName, 'good');
        if exist(goodFolderPath, 'dir')
            h5Files = dir(fullfile(goodFolderPath, '*.h5'));
            for fileIdx = 1:length(h5Files)
                h5FileName = h5Files(fileIdx).name;
                h5FilePath = fullfile(goodFolderPath, h5FileName);
               
                fprintf('Processing %s...\n', h5FilePath);
                
                
                data = h5read(h5FilePath, '/vibration_data');
                
                
                t = (1:size(data, 1)) / 2000;   
            end
        else
          
            fprintf('No "good" folder for %s - %s\n', machineName, processName);
        end
    end
end