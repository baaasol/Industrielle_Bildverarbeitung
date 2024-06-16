%%-----TextLocalThresh-----%%
clc; clear;
%%----------%%
img = imread('sine_shaded_text_small.png');
% Prüfen, ob das Bild RGB ist und zu Graustufen konvertieren, wenn nötig
if size(img, 3) == 3
    img = rgb2gray(img);
elseif size(img, 3) == 1
    disp('Das Bild ist bereits in Graustufen.');
else
    disp('Das Bildformat wird nicht unterstützt oder ist unbekannt.');
    return;
end
%%----------%%
figure;
subplot(1,3,1)
imshow(img);
title('Originalbild');
%%----------%%
[rows, cols] = size(img);
windowSize = 21; % Fenstergröße für lokale Analyse
halfWindow = floor(windowSize / 2);
%%----------%%
processedImg = zeros(rows, cols);
%%----------%%
for u = (1 + halfWindow):(rows - halfWindow)
    for v = (1 + halfWindow):(cols - halfWindow)
        % Umgebung extrahieren
        localRegion = img(u-halfWindow:u+halfWindow, v-halfWindow:v+halfWindow);
        % Mittelwert und Standardabweichung berechnen
        m = mean(localRegion(:));
        s = std(double(localRegion(:)));
        % Lokalen Schwellenwert bestimmen
        k = -0.85; % Dieser Wert kann variiert werden, um k_opt zu finden
        T = m + k * s;
        % Klassifizierung des Pixels
        if img(u, v) < T
            processedImg(u, v) = 0; % Text
        else
            processedImg(u, v) = 255; % Hintergrund
        end
    end
end
%%----------%%
processedImgCut = zeros(rows - windowSize,cols - windowSize);
for i = (1 + halfWindow):(rows - halfWindow)
    for t = (1 + halfWindow):(cols - halfWindow)
        processedImgCut(i - halfWindow,t - halfWindow) = processedImg(i,t);
    end
end
%%----------%%
subplot(1,3,2)
imshow(processedImgCut, []);
title('Lokale Schwellenwertverarbeitung');
%%----------%%
SE = [0 1 0; 1 1 1; 0 1 0];
% Morphologische Öffnung
processedImgCut = imopen(processedImgCut, SE);
%%----------%%
subplot(1,3,3)
imshow(processedImgCut, []);
title('Verbessertes Bild nach morphologischer Öffnung');
hold on;
%%----------%%