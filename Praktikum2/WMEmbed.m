%%-----WMEmbed-----%%
function [] = WMEmbed(img, watermark)
imgNew = img;
imgNew = bitset(imgNew, 1, watermark);
imwrite(imgNew, 'myCoinsWM.png');
end
%%----------%%