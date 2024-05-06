function [] = WMExtract(img)
figure(1);
for i=1:8
    subplot(2,4,i);
    bitplane = 256 * bitget(img, i);
    imshow(bitplane);
    title(['Bitplane ', num2str(i)]);
end
figure(2);
subplot(1,2,1);
watermark = 256 * bitget(img, 1);
imshow(watermark);
title('Wasserzeichen');
subplot(1,2,2);
imshow(img);
title('Original-Bild');
hold on;
imwrite(watermark, 'WM.png')
end