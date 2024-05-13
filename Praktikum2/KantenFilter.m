function [] = KantenFilter(fType)
% Bilder erweitern wegen Filtern
img = uint8(imread('Schachbrett.png'));
switch fType
    case 1 % 3x3 Prewitt-Filter x-Richtung

    case 2 % 3x3 Prewitt-Filter x-Richtung
    case 3 % 5x5 LoG-Filter
    otherwise
        error('Falschen Wert übergeben. Wert muss zwischen 1 und 3 liegen')
end
end