% squarePart:
%   1 - lewy górny trójk¹t
%   2 - prawy dolny trójk¹t
function [ row, column, squarePart ] = getTriangleByCoordinates(x0, y0, H, n, x, y)

if (x < x0) || (x > x0+H)
    error('x coordinate out of bounds');
elseif (y < y0) || (y > y0+H)
    error('y coordinate out of bounds');
end

row = floor((y - y0) / n);
column = floor((x - x0) / n);

h = H / n;
singleSquareX0 = x0 + column*h;
singleSquareY0 = y0 + row*h;

% Sprawdzenie czy jest powyzej przekatnej o wspolczynniku kierunkowym 1
if (y - singleSquareY0) > (x - singleSquareX0)
    squarePart = 1;
else
    squarePart = 2;
end

end

