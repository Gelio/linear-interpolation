% totalError = calculateInterpolationError(f, x0, y0, H, coefficients) -
% funkcja obliczajaca blad sredniokwadratowy dla interpolacji liniowej
% funkcji f na 2n^2 trojkatach przystajacych wpisanych w kwadrat o boku H,
% ktorego lewy dolny wierzcholek ma wspolrzedne (x0, y0). Wspolczynniki
% funkcji interpolujacych sa zawarte w 4-wymiarowej tablicy coefficients.
%
% Wartosci bledu interpolacji dla kazdego trojkata sa obliczane w jego
% srodku ciezkosci.
%
% Wejscie:
% f - funkcja interpolowana
% x0, y0 - wspolrzedne lewego dolnego wierzcholka kwadratu
% H - dlugosc boku kwadratu
% coefficients - 4-wymiarowa tablica zawierajaca wspolczynniki dla funkcji
% interpolujacych (zobacz **help calculateCoefficientsSquare**)
%
% Wyjscie:
% totalError - wartosc bledu sredniokwadratowego interpolacji
%
% Autor: Grzegorz Rozdzialik (D4, gr. lab. 2)

function totalError = calculateInterpolationError(f, x0, y0, H, coefficients)
% Ilosc podzialow
n = size(coefficients, 1);
% Wymiary kwadratu
h = H / n;

totalError = 0;

for i=1:n
    for j=1:n
        % Obliczenie wspolrzednych kwadratu zawierajacego dwa trojkaty
        bottomLeftX = x0 + j*h;
        bottomLeftY = y0 + i*h;
        [gravityCenter1, gravityCenter2] = getTrianglesGravityCenter(bottomLeftX, bottomLeftY, h);
        
        % Lewy gorny trojkat
        exactValue = f(gravityCenter1(1), gravityCenter1(2));
        interpolatedValue = coefficients(i, j, 1, 1)  ...
                            + coefficients(i, j, 1, 2) * gravityCenter1(1) ...
                            + coefficients(i, j, 1, 3) * gravityCenter1(2);
        totalError = totalError + (exactValue - interpolatedValue) .^ 2;
        
        % Prawy dolny trojkat
        exactValue = f(gravityCenter2(1), gravityCenter2(2));
        interpolatedValue = coefficients(i, j, 2, 1) ...
                            + coefficients(i, j, 2, 2) * gravityCenter2(1) ...
                            + coefficients(i, j, 2, 3) * gravityCenter2(2);
        totalError = totalError + (exactValue - interpolatedValue) .^ 2;
    end
end

totalError = totalError / (2 * n^2);


end

