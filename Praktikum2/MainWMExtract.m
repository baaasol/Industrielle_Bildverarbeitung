%%-----MainWMExtract-----%%
clear; clc;
%%----------%%
img = uint8(imread('coinsWM.png'));
WMExtract(img);
img2 = uint8(imread('coins.png'));
img3 = uint8(imread('WM.png'));
WMEmbed(img2, img3);