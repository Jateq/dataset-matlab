data = readtable('Sample.csv', 'VariableNamingRule', 'preserve');
data = removevars(data, {'Var10', 'Var11', 'Var12'});
data.MAKE = grp2idx(data.MAKE);
data.MODEL_1 = grp2idx(data.MODEL_1);
data.VEHICLE_CLASS = grp2idx(data.('VEHICLE CLASS'));
data.TRANSMISSION = grp2idx(data.TRANSMISSION);
data.FUEL = grp2idx(data.FUEL);

figure;
scatter(data.ENGINE_SIZE, data.CO2_EMISSIONS);
xlabel('Engine Size (L)');
ylabel('CO2 Emissions (g/km)');
title('CO2 Emissions vs. Engine Size');

figure;
scatter(data.('FUEL_CONSUMPTION*'), data.CO2_EMISSIONS);
xlabel('Fuel Consumption (L/100 km)');
ylabel('CO2 Emissions (g/km)');
title('CO2 Emissions vs. Fuel Consumption');

corrMatrix = corr(table2array(data(:, {'ENGINE_SIZE', 'CYLINDERS', 'FUEL_CONSUMPTION*', 'CO2_EMISSIONS'})));
disp('Correlation Matrix:');
disp(corrMatrix);

X = table2array(data(:, {'ENGINE_SIZE', 'CYLINDERS', 'FUEL_CONSUMPTION*'}));
y = data.CO2_EMISSIONS;
mdl = fitlm(X, y);
disp(mdl);

figure;
plot(mdl);
title('Linear Regression Model: Predicted vs. Actual CO2 Emissions');

writetable(data, 'Processed_Sample.csv');
