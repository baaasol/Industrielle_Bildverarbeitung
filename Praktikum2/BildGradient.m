function [] = BildGradient(img)
[u, v] = size(img);
e = zeros(u, v);
phi = zeros(u, v);
prewittX = [-1 0 1; -1 0 1; -1 0 1];
prewittY = [-1 -1 -1; 0 0 0; 1 1 1];
imgDx = imfilter(img, prewittX);
imgDy = imfilter(img, prewittY);
for i = 1:u % => Zeilen
    for n = 1:v % => Spalten
        e(i,n) = sqrt(imgDx(i,n)^2 + imgDy(i,n)^2);
        phi(i,n) = 255 - atan2d(imgDy(i,n), imgDx(i,n));
    end
end
%%----------%%
[eMat, phiMat] = imgradient(img, 'prewitt');
%%----------%%
figure("Name",'Gradientenstärke u. Richtung');
%%----------%%
subplot(3,5,3);
imshow(uint8(img));
title('Original');
%%----------%%
subplot(3,5,7);
imshow(imgDx, []);
title('Dx(u,v)');
%%----------%%
subplot(3,5,9);
imshow(imgDy, []);
title('Dy(u,v)');
%%----------%%
subplot(3,5,11);
imshow(e, []);
title('Gradientenstärke manuell');
%%----------%%
subplot(3,5,12);
imshow(phi, []);
title('Gradientenrichtung manuell');
%%----------%%
subplot(3,5,14);
imshow(eMat, []);
title('Gradientenstärke Matlab-Funktion');
%%----------%%
subplot(3,5,15);
imshow(phiMat, []);
title('Gradientenrichtung Matlab-Funktion');
hold on;
end
%%----------%%