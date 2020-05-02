function [x_star,eucl_norm, SE, RMSE] = leastSquares(A,b)
%leastSquare: takes as inputs matrix A and vector b of a system Ax = b and
%returns as outputs the least squares solutions x*, the Euclidean norm of
%the residual, the SE and the RMSE
%   Detailed explanation goes here
    %x_star = A \ b;
    if det(A'*A) == 0
        pinv_A = pinv(A);
        [row, ~] = size(pinv_A);
        x_star = pinv_A*b + (eye(row) - pinv_A*A)*ones(row,1);
    else
        x_star = (A' * A) \ A' * b;
    end
    r = b - A * x_star;
    eucl_norm = norm(r);
    SE = eucl_norm ^ 2;
    m = size(b,1);
    RMSE = sqrt(SE/m);
end

