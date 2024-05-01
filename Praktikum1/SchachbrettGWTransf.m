%%-----SchachbrettGWTransf-----%%
clear; clc;
%%-----Aufgabe1-----%%
Img = uint8(imread('Schachbrett.png'));
figure("Name",'Schachbrett.png Ausgangsbild vs. linear transformiert');
subplot(2,2,1);
imshow(uint8(Img));
subplot(2,2,2);
imhist(uint8(Img));
%%-----Aufgabe2-----%%
Img = double(imread('Schachbrett.png'));
[minImg,maxImg] = bounds(Img,"all");
Img_Lin_Trans = (255 / (maxImg - minImg)) * (Img - minImg);
subplot(2,2,3);
imshow(uint8(Img_Lin_Trans));
subplot(2,2,4);
imhist(uint8(Img_Lin_Trans));
hold on;