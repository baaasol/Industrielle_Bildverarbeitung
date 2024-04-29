%%-----SchachbrettGWTransf-----%%
clear;
clc;
%%-----Aufgabe1-----%%
Img = uint8(imread('Schachbrett.png'));
figure;
imhist(Img)
%%-----Aufgabe2-----%%
Img = double(imread('Schachbrett.png'));
[minImg,maxImg] = bounds(Img,"all");
Img_Lin_Trans = (255 / (maxImg - minImg)) * (Img - 50);
figure;
subplot(1,2,1);
imshow(uint8(Img_Lin_Trans));
subplot(1,2,2);
imhist(uint8(Img_Lin_Trans));
hold on;