%function [] = KantenFilter(fType)
% Bilder erweitern wegen Filtern
img = uint8(imread('Schachbrett.png'));
[u, v] = size(img);
imgNew = zeros(u, v);
fType = 1;
switch fType
    case 1 % 3x3 Prewitt-Filter x-Richtung
        filter = [-1 0 1; -1 0 1; -1 0 1];
        imgFilter = padarray(img, [1, 1], 0, 'both'); % Bild vergrößern
        [u2, v2] = size(imgFilter);
        for i = 2:u2-1 % i => Zeilen
            for n = 2:v2-1 % n => Spalten              
                imgNew(i-1,n-1) = (0.5*(filter(1,1)*imgFilter(i-1,n-1) + filter(1,2)*imgFilter(i,n-1) + filter(1,3)*imgFilter(i+1,n-1)) + 0.5*((filter(2,1)*imgFilter(i-1,n) + filter(2,2)*imgFilter(i,n) + filter(2,3)*imgFilter(i+1,n)) + 0.5*((filter(3,1)*imgFilter(i-1,n+1) + filter(3,2)*imgFilter(i,n+1) + filter(3,3)*imgFilter(i+1,n+1))))/3);
            end
        end
    case 2 % 3x3 Prewitt-Filter x-Richtung
        filter = [-1 -1 -1; 0 0 0; 1 1 1];
        imgFilter = padarray(img, [1, 1], 0, 'both'); % Bild vergrößern
        [u2, v2] = size(imgFilter);
        for i = 2:u2-1 % i => Zeilen
            for n = 2:v2-1 % n => Spalten              
                imgNew(i-1,n-1) = (0.5*(filter(1,1)*imgFilter(i-1,n-1) + filter(1,2)*imgFilter(i,n-1) + filter(1,3)*imgFilter(i+1,n-1)) + 0.5*((filter(2,1)*imgFilter(i-1,n) + filter(2,2)*imgFilter(i,n) + filter(2,3)*imgFilter(i+1,n)) + 0.5*((filter(3,1)*imgFilter(i-1,n+1) + filter(3,2)*imgFilter(i,n+1) + filter(3,3)*imgFilter(i+1,n+1))))/3);
            end
        end
    case 3 % 5x5 LoG-Filter
        filter = [0 0 -1 0 0; 0 -1 -2 -1 0; -1 -2 16 -2 -1; 0 -1 -2 -1 0; 0 0 -1 0 0];
        imgFilter = padarray(img, [2, 2], 0, 'both'); % Bild vergrößern
        [u2, v2] = size(imgFilter);
        for i = 2:u2-2 % i => Zeilen
            for n = 2:v2-2 % n => Spalten              
                imgNew(i-2,n-2) = (0.5*(filter(1,1)*imgFilter(i-1,n-1) + filter(1,2)*imgFilter(i,n-1) + filter(1,3)*imgFilter(i+1,n-1)) + 0.5*((filter(2,1)*imgFilter(i-1,n) + filter(2,2)*imgFilter(i,n) + filter(2,3)*imgFilter(i+1,n)) + 0.5*((filter(3,1)*imgFilter(i-1,n+1) + filter(3,2)*imgFilter(i,n+1) + filter(3,3)*imgFilter(i+1,n+1))))/3);
            end
        end
    otherwise
        error('Falschen Wert übergeben. Wert muss zwischen 1 und 3 liegen')
end
figure("Name",'Schachbrett.png Ausgangsbild vs. gefiltert');
subplot(1,2,1);
title('Original');
imshow(uint8(img));
subplot(1,2,2);
title('Gefiltert');
imshow(uint8(imgNew));
hold on;
%end