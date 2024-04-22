%%-----GWVerlauf-----%%
clear
clc
cols = 256;
rows = cols;
GW = zeros(rows,cols);
%%-----GWVerlauf links n. rechts = 1-----%
for i=1:cols
    GW(i,:) = [0:1:255];
end
GWVerlauf = input('GWVerlauf v. links nach rechts (=1) o. umgekehrt (=2)');
switch GWVerlauf
    case{1}
        imwrite(uint8(GW), 'BildNew.tif');
    case{2}
        GW = flip(GW,2);
        imwrite(uint8(GW), 'BildNew.tif');
end