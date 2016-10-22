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

