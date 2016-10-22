% interpolacja na kwadracie (dzieli kwadrat na dwa trojkaty przystajace)
% (x0, y0) - lewy dolny rog kwadratu
% coefficients - wspolczynniki do funkcji interpolujacej:
%   - na trojkacie majacym kat prosty w lewym gornym rogu kwadratu
%   - na trojkacie majacym kat prosty w prawym dolnym rogu kwadratu

function coefficients = interpolateSingleSquare(f, x0, y0, h)
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

