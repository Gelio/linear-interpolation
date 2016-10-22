% [row, column, squarePart] = getTriangleByCoordinates(x0, y0, H, n, x, y)
% - funkcja sprawdzajaca do jakiego trojkata nalezy punkt (x, y) i
% zwracajaca jego indeksy (uzyteczne do odwolywania sie do tablicy
% coefficients).
%
% Wejscie:
% (x0, y0) - wspolrzedne lewego dolnego wierzcholka kwadratu, na ktorym
% odbywa sie interpolacja
% H - dlugosc boku kwadratu, na ktorym odbywa sie interpolacja
% n - parametr okreslajacy ilosc podzialow kwadratu (2n^2 trojkatow)
% (x, y) - wspolrzedne zadanego punktu, dla ktorego chcemy obliczyc indeksy
% trojkata
%
% Wyjscie:
% row - wiersz, w ktorym znajduje sie trojkat dla punktu (x, y)
% column - kolumna, w ktorej znajduje sie trojkat dla punktu (x, y)
% squarePart - polowa kwadratu, w ktorej znajduje sie trojkat dla punktu
% (x, y):
% *  1 - lewa gorna polowa
% *  2 - prawa dolna polowa
%
% Autor: Grzegorz Rozdzialik (D4, gr. lab. 2)


function [row, column, squarePart] = getTriangleByCoordinates(x0, y0, H, n, x, y)

if (x < x0) || (x > x0+H)
    error('x coordinate out of bounds');
elseif (y < y0) || (y > y0+H)
    error('y coordinate out of bounds');
end

h = H / n;

row = floor((y - y0) / h);
column = floor((x - x0) / h);

singleSquareX0 = x0 + column*h;
singleSquareY0 = y0 + row*h;

% Sprawdzenie czy jest powyzej przekatnej o wspolczynniku kierunkowym 1
if (y - singleSquareY0) > (x - singleSquareX0)
    squarePart = 1;
else
    squarePart = 2;
end

% Poniewaz indeksowanie jest od 1 nalezy zmienic row i column
row = row + 1;
column = column + 1;

% Sprawdzenie czy aktualne polozenie nie jest na skraju kwadratu
if x == x0+H
    column = column - 1;
end
if y == y0+H
    row = row - 1;
end
end

