%%-----Park-----%%
clc; clear;
%%----------%%
img = uint8(imread('ParkGraySmall.png'));
figure;
subplot(1,3,1)
imshow(img);
title('Originalbild');
% Auswahl der Pixelpositionen mit getpts
h = figure;
imshow(img);
[x, y] = getpts(h);
x = uint32(x);
y = uint32(y);
close(h);
% Bestimmen der Farbbereiche der ausgewählten Punkte
selectedPixels = zeros(length(x), 3, 'uint8');
for i = 1:length(x)
    selectedPixels(i, :) = img(y(i), x(i), :);
end
% Minimum und Maximum für jeden Farbkanal
minVals = min(selectedPixels);
maxVals = max(selectedPixels);
% Erweiterung des Farbbereichs
minVals = uint8(0.9 * double(minVals));
maxVals = uint8(1.1 * double(maxVals));
% Schwellenwert für die Höhe, um Färben der Haare zu vermeiden
heightThreshold = round(size(img, 1) * 0.45);
% Maske erstellen, um Himmel zu identifizieren
mask = false(size(img, 1), size(img, 2));
for row = 1:heightThreshold
    for col = 1:size(img, 2)
        pixel = squeeze(img(row, col, :))';
        if all(pixel >= minVals) && all(pixel <= maxVals)
            mask(row, col) = true;
        end
    end
end
% Ersetzen des grauen Himmels durch blauen Himmel
blueColor1 = [100, 200, 250];
blueColor2 = [176,226,255];
img2 = img;
for row = 1:size(img, 1)
    for col = 1:size(img, 2)
        if mask(row, col)
            img(row, col, :) = blueColor1;
        end
    end
end
for row = 1:size(img2, 1)
    for col = 1:size(img2, 2)
        if mask(row, col)
            img2(row, col, :) = blueColor2;
        end
    end
end
%%----------%%
subplot(1,3,2)
imshow(img);
title('Ersetzter Himmel Blauton A');
subplot(1,3,3)
imshow(img2);
title('Ersetzter Himmel Blauton B');
hold on;
%%----------%%