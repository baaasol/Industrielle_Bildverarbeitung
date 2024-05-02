%%-----SchachbrettGWTransf-----%%
clear; clc;
%%-----Aufgabe1-----%%
img = uint8(imread('Schachbrett.png'));
figure("Name",'Schachbrett.png Ausgangsbild vs. linear transformiert');
subplot(2,2,1);
imshow(uint8(img));
subplot(2,2,2);
imhist(uint8(img));
%%-----Aufgabe2-----%%
img = double(imread('Schachbrett.png'));
[minImg,maxImg] = bounds(img,"all");
imgLinTrans = (255 / (maxImg - minImg)) * (img - minImg);
subplot(2,2,3);
imshow(uint8(imgLinTrans));
subplot(2,2,4);
imhist(uint8(imgLinTrans));
hold on;