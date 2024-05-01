function [] = GWVerlauf(richtung)
%GWVerlauf Summary of this function goes here
imgSize = 256;
img = zeros(imgSize);
for i=1:imgSize
    img(i,:) = (0:1:255);
end
switch richtung
    case 'links'
        imwrite(uint8(img), 'BildNew.tif');
        subplot(1,2,1);
        title('Grauwertverlauf--->');
        imshow(uint8(img));
        FlipImg = flip(img,2);
        subplot(1,2,2);
        title('<---Grauwertverlauf');
        imshow(uint8(FlipImg));
        sgtitle('Grauwertverläufe');
        hold on;
    case 'rechts'
        FlipImg = flip(img,2);
        imwrite(uint8(FlipImg), 'BildNew.tif');
        subplot(1,2,2);
        title('<---Grauwertverlauf');
        imshow(uint8(FlipImg));
        subplot(1,2,1);
        title('Grauwertverlauf--->');
        imshow(uint8(img));
        sgtitle('Grauwertverläufe');
        hold on;
    otherwise
        error('Falschen Wert übergeben. Entweder links oder rechts')
end
%   Detailed explanation goes here
end