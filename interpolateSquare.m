% interpolateSquare(f, x0, y0, H, n, epsilon, log, displayType, plotStep) -
% funkcja tworzaca w nowym oknie wykres dla interpolacji funkcji f na
% kwadracie o boku H, ktorego lewym dolnym wierzcholkiem jest punkt
% (x0, y0), dzielac go na 2n^2 trojkatow przystajacych. Podzial kwadratu
% jest zageszczany, az do osiagniecia bledu sredniokwadratowego, mierzonego
% w srodkach ciezkosci trojkatow, mniejszego od epsilon.
% 
% Funkcja moze rysowac zarowno wykres funkcji interpolujacej,
% interpolowanej, dwa jednoczesnie, oraz wykres bledu.
%
% Funkcja opcjonalnie wypisuje informacje diagnostyczne w konsoli.
%
% Wejscie:
% f - funkcja interpolowana (f: RxR -> R)
% (x0, y0) - lewy dolny wierzcholek kwadratu, na ktorym ma sie odbyc
% interpolacja
% H - dlugosc boku kwadratu do interpolacji
% n - startowa ilosc parametru sluzacego do podzialu kwadratu
% epsilon - maksymalna zadana wartosc bledu sredniokwadratowego
% log - parametr zezwalajacy na wypisanie informacji diagnostycznych (1 -
% wypisz, 0 - nie wypisuj)
% displayType - parametr okreslajacy rodzaj wykresu:
% * 0 - brak wykresu (tylko wypisz wiadomosci kontrolne, o ile zezwolone)
% * 1 - tylko funkcja interpolowana f
% * 2 - tylko funkcja interpolujaca p
% * 3 - obie funkcje (f oraz p)
% * 4 - wykres bledu (f - p)
% plotPointDensity - na ile punktow zostanie podzielona kazda z osi
% kwadratu w celu do stworzenia wykresu (o ile displayType > 0)
% 
% Autor: Grzegorz Rozdzialik (D4, gr. lab. 2)


function interpolateSquare(f, x0, y0, H, n, epsilon, log, displayType, plotPointDensity)
if nargin < 7
    log = 0;
end
if nargin < 8
    displayType = 3;
end
if nargin < 9
    plotPointDensity = 100;
end

errorConditionMet = 0;

% Zwiekszaj liczbe podzialow kwadratu (n) dopoki blad jest wiekszy niz
% zadana dokladnosc
divisionStart = tic;
while errorConditionMet == 0
    coefficientsCalculatingStart = tic;
    coefficients = calculateCoefficientsSquare(f, x0, y0, H, n);
    coefficientsCalculatingTime = toc(coefficientsCalculatingStart);
    
    interpolationErrorCalculatingStart = tic;
    interpolationError = calculateInterpolationError(f, x0, y0, H, coefficients);
    interpolationErrorCalculatingTime = toc(interpolationErrorCalculatingStart);

    errorConditionMet = interpolationError < epsilon;
    if errorConditionMet == 0
        n = n+1;
    end
end
divisionTime = toc(divisionStart);

% Dokladnosc spelniona, wypisanie informacji diagnostycznych
if log == 1
    fprintf('Osiagnieto zadana dokladnosc przy n = %d (%d trojkatow przystajacych).\n', n, 2*n^2);
    fprintf('Podzial trwal %f ms.\n', divisionTime*1000);
    fprintf('Obliczanie ostatecznych wspolczynnikow dla funkcji interpolujacych trwalo %f ms.\n', coefficientsCalculatingTime*1000);
    fprintf('Sprawdzanie ostatecznego bledu interpolacji trwalo %f ms.\n', interpolationErrorCalculatingTime*1000);
    fprintf('Osiagnieto blad interpolacji rowny %g (zadano %g).\n', interpolationError, epsilon);
end

% Tworzenie wykresu
plotPointDivision = linspace(0, H, plotPointDensity);
x = x0 + plotPointDivision;
y = y0 + plotPointDivision;
exactValues = zeros(length(x), length(y));
interpolatedValues = zeros(length(x), length(y));

tic;
for i=1:length(y)
    for j=1:length(x)
        exactValues(i, j) = f(x(j), y(i));
        [row, column, squarePart] = getTriangleByCoordinates(x0, y0, H, n, x(j), y(i));
        interpolatedValues(i, j) = coefficients(row, column, squarePart, 1) ...
                                    + coefficients(row, column, squarePart, 2) * x(j) ...
                                    + coefficients(row, column, squarePart, 3) * y(i);
    end
end
valuesCalculatingTime = toc;
if log == 1
    fprintf('Obliczanie wartosci do wykresu trwalo %f ms.\n\n', valuesCalculatingTime*1000);
end


if displayType ~= 0
    figure;
end
% Stworzenie wykresu i legendy
% Powierzchnia dokladnych wartosci
if displayType == 1 || displayType == 3
    surf(x, y, exactValues, ones(length(x)));
    hold on;
    legend('Funkcja dokladna f', 'Location', 'Best');
end

% Powierzchnia wartosci interpolowanych
if displayType == 2 || displayType == 3
    surf(x, y, interpolatedValues, ones(length(x)) + 1);
    hold on;
    legend('Funkcja interpolujaca p', 'Location', 'Best');
end

if displayType == 3
    legend('Funkcja dokladna f', 'Funkcja interpolujaca p', 'Location', 'Best');
end

% Powierzchnia bledu
if displayType == 4
    surf(x, y, exactValues - interpolatedValues, ones(length(x)) + 2);
    hold on;
    legend('Blad (funkcja dokladna f - interpolujaca p)', 'Location', 'Best');
end

% Opis wykresu
title('Interpolacja liniowa');

% Opis osi
xlabel('os x');
ylabel('os y');
zlabel('os z (wartosc funkcji)');

% Skalowanie osi
xMin = x0 - H/8;
xMax = x0 + 9/8*H;
yMin = y0 - H/8;
yMax = y0 + 9/8*H;
axis vis3d;
xlim([xMin xMax]);
ylim([yMin yMax]);


end

