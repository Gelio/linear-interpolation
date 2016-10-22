% coefficients = calculateCoefficientsSingleSquare(f, x0, y0, h) - funkcja
% obliczajaca wspolczynniki dla liniowej funkcji interpolujacej na
% kwadracie o boku h, ktorego lewym dolny wierzcholek ma wspolrzedne
% (x0, y0).
%
% Funkcja dzieli opisany kwadrat na dwa trojkaty przystajace (jeden
% zawierajacy lewy i gorny bok kwadratu oraz przekatna, drugi bedacy
% dopelnieniem pierwszego) i wykonuje interpolacje na tych trojkatach.
%
% Wejscie:
% f - uchwyt do funkcji interpolowanej (f: RxR -> R)
% x0, y0 - wspolrzedne lewego dolnego wierzcholka kwadratu
% h - dlugosc boku kwadratu
%
% Wyjscie:
% coefficients - macierz 2x3 majaca jako pierwsza kolumne wspolczynniki
% funkcji interpolujacej dla pierwszego trojkata (lewa gorna polowa
% kwadratu), jako druga kolumna - wspolczynniki dla drugiego trojkata
% (prawa dolna polowa kwadratu)
%
% Autor: Grzegorz Rozdzialik (D4, gr. lab. 2)

function coefficients = calculateCoefficientsSingleSquare(f, x0, y0, h)
coefficients = zeros(2, 3);

topLeft = f(x0, y0+h);
topRight = f(x0+h, y0+h);
bottomLeft = f(x0, y0);
bottomRight = f(x0+h, y0);


% Lewy gorny trojkat
A1 = [
    1  x0  y0;
    1 x0+h y0+h;
    1  x0  y0+h
    ];
b1 = [
    bottomLeft;
    topRight;
    topLeft
    ];

coefficients(1, :) = reshape(linsolve(A1, b1), 1, 3);


% Prawy dolny trojkat
A2 = [
    1  x0  y0;
    1 x0+h y0;
    1 x0+h y0+h
    ];
b2 = [
    bottomLeft;
    bottomRight;
    topRight
    ];

coefficients(2, :) = reshape(linsolve(A2, b2), 1, 3);

end

