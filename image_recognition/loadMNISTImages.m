% Function to load MNIST images
function images = loadMNISTImages(filename)
    fid = fopen(filename, 'rb');
    magicNumber = fread(fid, 1, 'int32', 0, 'ieee-be');
    if magicNumber ~= 2051
        error('Invalid magic number in MNIST image file.');
    end
    numImages = fread(fid, 1, 'int32', 0, 'ieee-be');
    numRows = fread(fid, 1, 'int32', 0, 'ieee-be');
    numCols = fread(fid, 1, 'int32', 0, 'ieee-be');
    images = fread(fid, inf, 'unsigned char');
    images = reshape(images, numCols, numRows, numImages);
    images = permute(images,[2 1 3]);
    fclose(fid);
    images = double(images) / 255; % Normalize pixel values to [0,1]
end