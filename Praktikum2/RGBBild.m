%%-----RGB-Bild-----%%
clear; clc;
%%----------%%
deutschlandFlagge = zeros(600, 900, 3, 'uint8');
deutschlandFlagge(201:400,:,1) = 255;
deutschlandFlagge(401:end,:,1) = 255;
deutschlandFlagge(401:end,:,2) = 215;
%%----------%%
figure;
%%----------%%
subplot(2,5,[2, 3, 4]);
imshow(deutschlandFlagge);
title('Deutschland-Flagge');
%%----------%%
subplot(2,5,7);
imshow(deutschlandFlagge(:,:,1));
title('R-Kanal');
%%----------%%
subplot(2,5,8);
imshow(deutschlandFlagge(:,:,2));
title('G-Kanal');
%%----------%%
subplot(2,5,9);
imshow(deutschlandFlagge(:,:,3));
title('B-Kanal');
%%----------%%