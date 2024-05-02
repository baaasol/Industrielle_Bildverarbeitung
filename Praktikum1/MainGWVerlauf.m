%%-----MainGWVerlauf-----%%
clear; clc;
%%----------%%
x = input('Bitte gib die Richtung des Grau-Weiß-Verlaufs (links=1 || rechts=2):');
if x == 1
    x = 'links';
elseif x == 2
    x = 'rechts';
end
img = GWVerlauf(x);
imgFlip = flip(img,2);
figure("Name",'Grauwertverlauf');
if strcmp(x,'links')
    subplot(1,2,1);
    imshow(uint8(img));
    title('Grauwertverlauf--->');
    subplot(1,2,2);
    imshow(uint8(imgFlip));
    title('<---Grauwertverlauf');
    hold on;
elseif strcmp(x,'rechts')
    subplot(1,2,2);
    imshow(uint8(img));
    title('<---Grauwertverlauf');
    subplot(1,2,1);
    imshow(uint8(imgFlip));
    title('Grauwertverlauf--->');
    hold on;
end