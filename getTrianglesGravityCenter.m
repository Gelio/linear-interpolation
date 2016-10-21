function [gravityCenterTopLeft, gravityCenterBottomRight] = getTrianglesGravityCenter(x0, y0, h)
gravityCenterTopLeft = [x0 + h/3    y0 - h/3];
gravityCenterBottomRight = [x0 + 2/3*h    y0 - 2/3*h];

end

