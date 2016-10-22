% coefficients = calculateCoefficientsSquare(f, x0, y0, H, n) - funkcja
% obliczajaca wspolczynniki dla liniowej funkcji interpolujacej na 2n^2
% trojkatach przystajacych wpisanych w kwadracie o boku H,
% ktorego lewym dolny wierzcholek ma wspolrzedne (x0, y0).
%
% Wejscie:
% f - uchwyt do funkcji interpolowanej (f: RxR -> R)
% x0, y0 - wspolrzedne lewego dolnego wierzcholka kwadratu
% H - dlugosc boku kwadratu
% n - parametr okreslajacy ilosc podzialow kwadratu
%
% Wyjscie:
% coefficients - 4-wymiarowa tablica zawierajaca wspolczynniki dla funkcji
% interpolujacych na trojkatach. Pierwszy wymiar - wiersz, drugi -
% kolumna, trzeci - ktory trojkat (1 - lewa gorna polowa kwadratu, 2 -
% prawa dolna polowa kwadratu), czwarty - wspolczynniki od 1 do 3 dla danej
% funckji
%
% Autor: Grzegorz Rozdzialik (D4, gr. lab. 2)


function coefficients = calculateCoefficientsSquare(f, x0, y0, H, n)
coefficients = zeros(n, n, 2, 3);
h = H / n;

for i=1:n
    for j=1:n
        singleSquareCoefficients = calculateCoefficientsSingleSquare(f, x0 + j*h, y0 + i*h, h);
        coefficients(i, j, 1, :) = singleSquareCoefficients(1, :);
        coefficients(i, j, 2, :) = singleSquareCoefficients(2, :);
    end
end


end

