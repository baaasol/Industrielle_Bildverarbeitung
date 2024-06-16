%%-----AlphaBlendingFarbe-----%%
clc; clear;
%%----------%%
appleImg = imread('apple1.jpg');
orangeImg = imread('orange1.jpg');
figure;
subplot(2,2,1)
imshow(appleImg);
title('Apfel');
subplot(2,2,2)
imshow(orangeImg);
title('Orange');
% Bilder in Grauwertbilder umwandeln
appleGray = rgb2gray(appleImg);
orangeGray = rgb2gray(orangeImg);
% Bildgrößen anpassen (falls unterschiedlich)
if size(appleGray) ~= size(orangeGray)
    error('Bilder haben unterschiedliche Größen');
end
%%----------%%
[rows, cols] = size(appleGray);
% Alpha-Blending für Grauwertbilder
blendedGray = zeros(rows, cols);
for i = 1:rows
    alpha = linspace(1, 0, cols);
    blendedGray(i, :) = alpha .* double(appleGray(i, :)) + (1 - alpha) .* double(orangeGray(i, :));
end
%%----------%%
subplot(2,2,3)
imshow(uint8(blendedGray));
title('Überblendetes Grauwertbild');
% Alpha-Blending für Farbbilder
blendedColor = zeros(rows, cols, 3);
for c = 1:3
    for i = 1:rows
        alpha = linspace(1, 0, cols);
        blendedColor(i, :, c) = alpha .* double(appleImg(i, :, c)) + (1 - alpha) .* double(orangeImg(i, :, c));
    end
end
%%----------%%
subplot(2,2,4)
imshow(uint8(blendedColor));
title('Überblendetes Farbbild');
hold on;
%%----------%%