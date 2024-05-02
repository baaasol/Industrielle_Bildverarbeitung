%%-----ReadShowPic-----%%
clear; clc;
%%-----Aufgabe1-----%%
img = uint8(imread('coinsWM.png'));
fprintf('Aufgabe 2.1\n')
[h,b] = size(img);
fprintf('Höhe des Bild:')
disp(h)
fprintf('Breite des Bild:')
disp(b)
[minImg,maxImg] = bounds(img,"all");
fprintf('Minimaler Grauwert:')
disp(minImg)
fprintf('Maximaler Grauwert:')
disp(maxImg)
%%-----Aufgabe2-----%
figure("Name",'Coin');
subplot(1,3,1);
imshow(img)
yline(50, 'red');
subplot(1,3,3);
imhist(img,50);
hold on;
%%-----Aufgabe3-----%%
imgNeg = 255-img;
subplot(1,3,2);
imshow(imgNeg);
hold on;
%%-----Aufgabe4-----%%
imwrite(uint8(img), 'coins.jpg');
%%-----Aufgabe5-----%%
fprintf('Aufgabe 2.5\n')
imgJPG = uint8(imread('coins.jpg'));
imgDiff = abs(double(img) - double(imgJPG));
minImgDiff = min(imgDiff(:));
maxImgDiff = max(imgDiff(:));
fprintf('Minimale Differenz:')
disp(minImgDiff)
fprintf('Maximale Differenz:')
disp(maxImgDiff)
figure("Name",'Histogramm PNG -> JPG');
histogram(imgDiff, 'BinWidth', 1);
hold on;
figure("Name",'Differenzbild PNG -> JPG');
imshow(imgDiff,[]); 
colormap(jet); 
colorbar; 