clc; clear; close all;
% Load image
[file,path]=uigetfile({'*.jpg;.jpeg;.png;.bmp;.tif','Image Files(.jpg,*.jpeg,*.png,*.bmp,*.tif)';'.','All Files(.*)'},'select image');
%check if the user selected a file or clicked cancel
if isequal(file,0)
    disp('user canceled file selection');
else
    %full file path
    datapath=fullfile(path,file);
    img=imread(datapath);
end
grayImg = rgb2gray(img); % Convert to grayscale (if colored)
% Enhance contrast (optional)
enhancedImg = imadjust(grayImg);
% Display original and preprocessed images
figure;
subplot(1,2,1); imshow(grayImg); title('Grayscale Image');
subplot(1,2,2); imshow(enhancedImg); title('Enhanced Image');
filteredImg = imgaussfilt(enhancedImg,1); % Apply median filtering
%filteredImg = medfilt2(enhancedImg,[3,3]);
% Display
figure;
imshow(filteredImg);
title('Filtered Image');
% Convert image to binary (Otsu's method)
bwImg = imbinarize(filteredImg, graythresh(filteredImg));
% Invert image if necessary (pores should be white)
bwImg = imcomplement(bwImg);
% Display
figure;
imshow(bwImg);
title('Binary Segmented Image');
% Remove small noise
se = strel('disk',2);
bwClean = imopen(bwImg, se); % Removes small objects (adjust size as needed)
% Fill holes
bwFinal = imfill(bwClean, 'holes');
% Display
figure;
imshow(bwFinal);
title('Refined Binary Image');
% Calculate total area
totalArea = numel(bwFinal);

% Calculate pore area
poreArea = sum(bwFinal(:));

% Porosity calculation
porosity = (poreArea / totalArea) * 100;

% Display result
fprintf('Estimated Porosity: %.2f%%\n',porosity);
% Overlay detected pores on original image
stats = regionprops(bwFinal, 'Centroid', 'Area');
figure; imshow(img); hold on;

for k = 1:length(stats)
    centroid = stats(k).Centroid;
    text(centroid(1), centroid(2), 'o', 'Color', 'red', 'FontSize', 10);
end

title('Pore Locations on Original Image');
hold off;
