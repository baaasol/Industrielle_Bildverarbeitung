%%-----SchachbrettHistEq-----%%
clear; clc;
%%-----Aufgabe1-----%%
img = uint8(imread('Schachbrett.png'));
figure("Name",'Schachbrett.png Ausgangsbild vs. Histogrammausgleich');
subplot(2,2,1);
imshow(uint8(img));
subplot(2,2,2);
imhist(uint8(img));
%%-----Aufgabe2-----%%
imgHistEqual = histeq(img);
subplot(2,2,3);
imshow(uint8(imgHistEqual));
subplot(2,2,4);
imhist(uint8(imgHistEqual));
hold on;