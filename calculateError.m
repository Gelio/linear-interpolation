function totalError = calculateError(f, x0, y0, H, coefficients)
% Ilosc podzialow
n = size(coefficients, 1);
% Wymiary kwadratu
h = H / n;

totalError = 0;

for i=1:n
    for j=1:n
        % Obliczenie wspolrzednych kwadratu zawierajacego dwa trojk¹ty
        bottomLeftX = x0 + j*h;
        bottomLeftY = y0 - i*h;
        [gravityCenter1, gravityCenter2] = getTrianglesGravityCenter(bottomLeftX, bottomLeftY, h);
        
        % Lewy gorny trojkat
        exactValue = f(gravityCenter1(1), gravityCenter1(2));
        interpolatedValue = coefficients(i, j, 1, 1) + coefficients(i, j, 1, 2) * x + coefficients(i, j, 1, 3) * y;
        totalError = totalError + (exactValue - interpolatedValue) .^ 2;
        
        % Prawy dolny trojkat
        exactValue = f(gravityCenter2(1), gravityCenter2(2));
        interpolatedValue = coefficients(i, j, 2, 1) + coefficients(i, j, 2, 2) * x + coefficients(i, j, 2, 3) * y;
        totalError = totalError + (exactValue - interpolatedValue) .^ 2;
    end
end

totalError = totalError / (2 * n^2);


end

