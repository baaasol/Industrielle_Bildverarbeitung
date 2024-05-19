function [] = BildGradient(img)
[u, v] = size(img);
%imgDx = zeros(u, v);
%imgDy = zeros(u, v);
E = zeros(u, v);
phi = zeros(u, v);
prewittX = [-1 0 1; -1 0 1; -1 0 1];
prewittY = [-1 -1 -1; 0 0 0; 1 1 1];
imgDx = imfilter(img, prewittX);
imgDy = imfilter(img, prewittY);
for i = 1:u % => Zeilen
    for n = 1:v % => Spalten
        E(i,n) = sqrt(imgDx(i,n)^2 + imgDy(i,n)^2);
        phi(i,n) = atan(imgDy(i,n) / imgDx(i,n));
    end
end
figure("Name",'Gradientenstärke u. Richtung');
subplot(3,3,2);
imshow(uint8(img));
title('Original');
subplot(3,3,4);
imshow(uint8(imgDx));
title('Dx(u,v)');
subplot(3,3,6);
imshow(uint8(imgDy));
title('Dy(u,v)');
subplot(3,3,7);
imshow(uint8(E));
title('Gradientenstärke');
subplot(3,3,9);
imshow(uint8(phi));
title('Gradientenrichtung');
hold on;
end