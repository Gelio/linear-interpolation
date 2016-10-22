% [gravityCenterTopLeft, gravityCenterBottomRight] =
% getTrianglesGravityCenter(x0, y0, h) - funkcja obliczajaca srodki
% ciezkosci trojkatow wpisanych w kwadrat o boku h, ktorego lewym dolnym
% wierzcholkiem jest punkt (x0, y0).
% Funkcja zaklada, ze podzial nastepuje wzdluz przekatnej o wspolczynniku
% kierunkowym rownym 1.
%
% Wejscie:
% (x0, y0) - wspolrzedne lewego dolnego wierzcholka kwadratu
% h - dlugosc boku kwadratu
%
% Autor: Grzegorz Rozdzialik (D4, gr. lab. 2)

function [gravityCenterTopLeft, gravityCenterBottomRight] = getTrianglesGravityCenter(x0, y0, h)
gravityCenterTopLeft = [x0 + h/3    y0 + 2/3*h];
gravityCenterBottomRight = [x0 + 2/3*h    y0 + h/3];

end

