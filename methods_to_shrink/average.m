% Average every 10 consecutive data points
averagedData = mean(reshape(data(1:floor(length(data)/10)*10), 10, []));