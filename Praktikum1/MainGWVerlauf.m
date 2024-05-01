%%-----MainGWVerlauf-----%%
clear; clc;
%%----------%%
x = input('Bitte gib die Richtung des Grau-Weiß-Verlaufs (links=1 || rechts=2):');
if x == 1
    x = 'links';
elseif x == 2
    x = 'rechts';
end
GWVerlauf(x);