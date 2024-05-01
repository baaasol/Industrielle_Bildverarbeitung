%%-----SchachbrettHistEq-----%%
clear; clc;
%%-----Aufgabe1-----%%
Img = uint8(imread('Schachbrett.png'));
figure("Name",'Schachbrett.png Ausgangsbild vs. Histogrammausgleich');
subplot(2,2,1);
imshow(uint8(Img));
subplot(2,2,2);
imhist(uint8(Img));
%%-----Aufgabe2-----%%
Img_Hist_Equal = histeq(Img);
subplot(2,2,3);
imshow(uint8(Img_Hist_Equal));
subplot(2,2,4);
imhist(uint8(Img_Hist_Equal));
hold on;