function [imgReturn] = GWVerlauf(richtung)
    imgSize = 256;
    imgReturn = zeros(imgSize);
    for i=1:imgSize
        imgReturn(i,:) = (0:1:255);
    end
    switch richtung
        case 'links'
        case 'rechts'
            imgReturn = flip(imgReturn,2);
        otherwise
            error('Falschen Wert übergeben. Entweder links oder rechts')
    end
end