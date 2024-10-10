
fprintf('Training set: %d images\n', training.count);
fprintf('Test set: %d images\n', test.count);

figure;
for i = 1:10
    subplot(2, 5, i);  
    imshow(training.images(:, :, i));
    title(['Label: ', num2str(training.labels(i))]);
end
