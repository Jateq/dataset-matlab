function S = SFG(X, y, U)
    % X - full set of features (matrix)
    % y - target variable
    % U - measure (e.g., accuracy threshold)
    
    numFeatures = size(X, 2);
    F = 1:numFeatures;  % Feature indices
    S = [];  % Initialize selected features
    
    while ~isempty(F)
        f = FindNext(F, X, y);  % Find the next feature
        S = [S, f];  % Add selected feature to S
        F(F == f) = [];  % Remove selected feature from F
        
        % Here you can implement your evaluation measure
        if evaluateMeasure(S, X, y) >= U  % Check if the measure is satisfied
            break;
        end
    end
end
