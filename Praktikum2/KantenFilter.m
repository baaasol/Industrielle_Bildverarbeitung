function [] = KantenFilter(fType)
img = double(imread('Schachbrett.png'));
[u, v] = size(img);
imgManualFiltered = zeros(u, v);
imgMatlabFiltered = zeros(u, v);
switch fType
    case 1 % 3x3 Prewitt-Filter x-Richtung
        filter = [-1 0 1; -1 0 1; -1 0 1];
        imgPadded = padarray(img, [1, 1], 0, 'both'); % Bild vergrößern        
        for i = 2:u+1 % i => Zeilen
            for n = 2:v+1 % n => Spalten
                window = double(imgPadded(i-1:i+1, n-1:n+1));
                imgManualFiltered(i-1, n-1) = sum(sum(window .* filter));
                imgMatlabFiltered = imfilter(img, filter);
            end
        end
    case 2 % 3x3 Prewitt-Filter x-Richtung
        filter = [-1 -1 -1; 0 0 0; 1 1 1];
        imgPadded = padarray(img, [1, 1], 0, 'both'); % Bild vergrößern        
        for i = 2:u+1 % i => Zeilen
            for n = 2:v+1 % n => Spalten              
                window = double(imgPadded(i-1:i+1, n-1:n+1));
                imgManualFiltered(i-1, n-1) = sum(sum(window .* filter));
                imgMatlabFiltered = imfilter(img, filter);
            end
        end
    case 3 % 5x5 LoG-Filter
        filter = [0 0 -1 0 0; 0 -1 -2 -1 0; -1 -2 16 -2 -1; 0 -1 -2 -1 0; 0 0 -1 0 0];
        imgPadded = padarray(img, [2, 2], 0, 'both'); % Bild vergrößern        
        for i = 3:u+2 % i => Zeilen
            for n = 3:v+2 % n => Spalten              
                window = double(imgPadded(i-2:i+2, n-2:n+2));
                imgManualFiltered(i-2, n-2) = sum(sum(window .* filter));
                imgMatlabFiltered = imfilter(img, filter);
            end
        end
    otherwise
        error('Falschen Wert übergeben. Wert muss zwischen 1 und 3 liegen')
end
figure("Name",'Schachbrett.png Ausgangsbild vs. gefiltert');
subplot(1,3,1);
imshow(uint8(img));
title('Original');
subplot(1,3,2);
imshow(uint8(imgManualFiltered));
title('Manuell Gefiltert');
subplot(1,3,3);
imshow(uint8(imgMatlabFiltered));
title('Durch Matlab-Funktion gefiltert');
hold on;
end