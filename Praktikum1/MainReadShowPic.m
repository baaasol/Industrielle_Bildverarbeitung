%%-----ReadShowPic-----%%
clear
clc
Img = uint8(imread('coinsWM.png'));
%%-----Aufgabe1-----%%
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
figure;
subplot(1,2,1);
imshow(Img)
yline(50, 'red');
subplot(1,2,2);
imhist(Img,50);
hold on;
%%-----Aufgabe3-----%%



