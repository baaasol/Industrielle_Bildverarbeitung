%%-----RGB-Bild-----%%
deutschlandFlagge = zeros(600, 900, 3, 'uint8');
deutschlandFlagge(201:400,:,1) = 255;
deutschlandFlagge(401:end,:,1) = 255;
deutschlandFlagge(401:end,:,2) = 215;

figure;

subplot(2, 4, [1, 2, 3, 4]);
imshow(deutschlandFlagge);
title('Deutschland-Flagge');

subplot(2, 4, 5);
imshow(deutschlandFlagge(:,:,1));
title('R-Kanal');

subplot(2, 4, 6);
imshow(deutschlandFlagge(:,:,2));
title('G-Kanal');

subplot(2, 4, 7);
imshow(deutschlandFlagge(:,:,3));
title('B-Kanal');
