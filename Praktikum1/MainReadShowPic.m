%%-----ReadShowPic-----%%
clear;
clc;
Img = uint8(imread('coinsWM.png'));
%%-----Aufgabe1-----%%
fprintf('Aufgabe 2.1\n')
[h,b] = size(Img);
fprintf('Höhe des Bild:')
disp(h)
fprintf('Breite des Bild:')
disp(b)
[minImg,maxImg] = bounds(Img,"all");
fprintf('Minimaler Grauwert:')
disp(minImg)
fprintf('Maximaler Grauwert:')
disp(maxImg)
%%-----Aufgabe2-----%
figure("Name",'Coin');
subplot(1,3,1);
imshow(Img)
yline(50, 'red');
subplot(1,3,3);
imhist(Img,50);
hold on;
%%-----Aufgabe3-----%%
Img_Neg = 255-Img;
subplot(1,3,2);
imshow(Img_Neg);
hold on;
%%-----Aufgabe4-----%%
imwrite(uint8(Img), 'coins.jpg');
%%-----Aufgabe5-----%%
fprintf('Aufgabe 2.5\n')
Img_JPG = uint8(imread('coins.jpg'));
Img_Diff = imabsdiff(Img_JPG,Img);
[minImg_Diff,maxImg_Diff] = bounds(Img_Diff,"all");
fprintf('Minimale Differenz:')
disp(minImg_Diff)
fprintf('Maximale Differenz:')
disp(maxImg_Diff)
figure("Name",'Histogramm PNG -> JPG');
histogram(Img_Diff)
hold on;
figure("Name",'Differenzbild PNG -> JPG');
imshow(Img_Diff,[]); 
colormap(jet); 
colorbar; 