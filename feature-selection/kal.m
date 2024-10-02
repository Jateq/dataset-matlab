data_clean = removevars(data, {'MothersOccupation', 'FathersOccupation'});
data_clean = rmmissing(data_clean);

X = table2array(data_clean(:, 1:end-1));  
Y = table2array(data_clean(:, end));      

fprintf('Initial number of features: %d\n', size(X, 2));

%% 1. Sequential Forward Feature Generation (SFG)
selectedSFG = [];
bestScore = Inf;

for i = 1:size(X, 2)
    currentBestFeature = -1;
    for j = 1:size(X, 2)
        if ~ismember(j, selectedSFG)
            tempFeatures = [selectedSFG, j];
            mdl = fitlm(X(:, tempFeatures), Y);
            currentScore = mdl.MSE;
            if currentScore < bestScore
                bestScore = currentScore;
                currentBestFeature = j;
            end
        end
    end
    if currentBestFeature ~= -1
        selectedSFG = [selectedSFG, currentBestFeature];
    end
end

fprintf('Selected features by SFG: %d\n', length(selectedSFG));

figure;
for i = 1:length(selectedSFG)
    subplot(1, length(selectedSFG), i);
    scatter(X(:, selectedSFG(i)), Y);
    xlabel(['Feature ' num2str(selectedSFG(i))]);
    ylabel('Target');
end
sgtitle('Sequential Forward Generation');

%% 2. Sequential Backward Generation (SBG)
selectedSBG = 1:size(X, 2);
for i = size(X, 2):-1:1
    bestScore = Inf;
    featureToRemove = -1;
    for j = selectedSBG
        tempFeatures = setdiff(selectedSBG, j);
        if ~isempty(tempFeatures)
            mdl = fitlm(X(:, tempFeatures), Y);
            currentScore = mdl.MSE;
            if currentScore < bestScore
                bestScore = currentScore;
                featureToRemove = j;
            end
        end
    end
    if featureToRemove ~= -1
        selectedSBG = setdiff(selectedSBG, featureToRemove);
    end
end

fprintf('Selected features by SBG: %d\n', length(selectedSBG));

figure;
for i = 1:length(selectedSBG)
    subplot(1, length(selectedSBG), i);
    scatter(X(:, selectedSBG(i)), Y);
    xlabel(['Feature ' num2str(selectedSBG(i))]);
    ylabel('Target');
end
sgtitle('Sequential Backward Generation');

%% 3. Bidirectional Generation (BG)
ModelBG = stepwiselm(X, Y, 'Criterion', 'AIC');
selectedBG = ModelBG.VariableNames(2:end);
validSelectedBG = selectedBG(selectedBG <= size(X, 2));

fprintf('Selected valid features by BG: %d\n', length(validSelectedBG));

figure;
for i = 1:length(validSelectedBG)
    subplot(1, length(validSelectedBG), i);
    scatter(X(:, validSelectedBG(i)), Y);
    xlabel(['Feature ' num2str(validSelectedBG(i))]);
    ylabel('Target');
end
sgtitle('Bidirectional Generation (Valid Features)');

%% 4. Random Generation (RG)
numRandomFeatures = 3;
selectedRG = randperm(size(X, 2), numRandomFeatures);
fprintf('Selected features by RG: %d\n', length(selectedRG));

figure;
for i = 1:length(selectedRG)
    subplot(1, length(selectedRG), i);
    scatter(X(:, selectedRG(i)), Y);
    xlabel(['Feature ' num2str(selectedRG(i))]);
    ylabel('Target');
end
sgtitle('Random Generation');

numRows = ceil(sqrt(length(validSelectedBG)));
numCols = ceil(length(validSelectedBG) / numRows);

figure('Name', 'Bidirectional Generation (Valid Features)', 'NumberTitle', 'off', 'Position', [100, 100, 1200, 800]);

for i = 1:length(validSelectedBG)
    subplot(numRows, numCols, i);
    scatter(X(:, validSelectedBG(i)), Y, 50, 'filled');
    xlabel(['Feature ' num2str(validSelectedBG(i))], 'FontSize', 12);
    ylabel('Target', 'FontSize', 12);
    title(['Feature ' num2str(validSelectedBG(i)) ' vs Target'], 'FontSize', 14);
    grid on;
end

sgtitle('Bidirectional Generation (Selected Features)', 'FontSize', 16, 'FontWeight', 'bold');
