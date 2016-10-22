function interpolateSquare(f, x0, y0, H, n, epsilon, log)
if nargin == 6
    log = 0;
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
    fprintf('Osiagnieto zadana dokladnosc przy n = %d (%d trojkatow przystajacych)\n', n, 2*n^2);
    fprintf('Podzial trwal %f ms\n', divisionTime*1000);
    fprintf('Obliczanie ostatecznych wspolczynnikow dla funkcji interpolujacych trwalo %f ms\n', coefficientsCalculatingTime*1000);
    fprintf('Sprawdzanie ostatecznego bledu interpolacji trwalo %f ms\n', interpolationErrorCalculatingTime*1000);
    fprintf('Osiagnieto blad interpolacji %g (zadano %g)\n', interpolationError, epsilon);
end

% Tworzenie wykresu
plotStep = 0.1;
x = x0:plotStep:(x0+H);
y = y0:plotStep:(y0+H);
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
    fprintf('Obliczanie wartosci do wykresu trwalo %f ms\n\n', valuesCalculatingTime*1000);
end


figure;
% Powierzchnia dokladnych wartosci
surf(x, y, exactValues, ones(length(x)));

% Powierzchnia wartosci interpolowanych
hold on;
surf(x, y, interpolatedValues, ones(length(x)) + 2);

% Opis wykresu i osi
legend('Funkcja dokladna', 'Funkcja interpolujaca');
xlabel('os x');
ylabel('os y');
zlabel('os z = f(x, y)');

% Skalowanie osi
xMin = x0 - H/8;
xMax = x0 + 9/8*H;
yMin = y0 - H/8;
yMax = y0 + 9/8*H;
axis vis3d;
xlim([xMin xMax]);
ylim([yMin yMax]);


end

