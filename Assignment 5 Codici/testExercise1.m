clc;
clear;
close all;
A1 = [1 0;1 0;1 0];
b1 = [1; 5; 6];

A2 = [1 1 0; 0 1 1; 1 2 1; 1 0 1];
b2 = [2; 2; 3; 4];

ATA_1 = A1.' * A1;
ATb_1 = A1.' * b1;

%disp(rank(A2));
%A1 \ b1
[x_star,eucl_norm, SE, RMSE] = leastSquares(A1, b1);
disp('x* for A1 and b1, and subsequent Euclidean Norm, SE and RMSE')
disp(x_star);
fprintf('Euclidean Norm = %.4f, SE = %.4f, RMSE = %.4f\n',eucl_norm, SE, RMSE)

disp(' ')

[x_star,eucl_norm, SE, RMSE] = leastSquares(A2, b2);
disp('x* for A2 and b2, and subsequent Euclidean Norm, SE and RMSE')
disp(x_star);
fprintf('Euclidean Norm = %.4f, SE = %.4f, RMSE = %.4f\n',eucl_norm, SE, RMSE)
