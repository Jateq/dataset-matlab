function f = FindNext(F, X, y)
    maxCor = -Inf;  % Initialize maximum correlation
    f = [];  % Initialize selected feature
    for featureIdx = 1:length(F)
        currentFeature = F(featureIdx);
        
        % Check for sufficient data length before calculating correlation
        if length(y) > 1 && length(X(:, currentFeature)) > 1
            currentCor = abs(corr(X(:, currentFeature), y));  
            if currentCor > maxCor
                maxCor = currentCor;  % Update maximum correlation
                f = currentFeature;  % Update feature to add
            end
        end
    end
end
