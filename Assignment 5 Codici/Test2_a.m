clc;
close all;
clear;
A = [1 0; 1 0; 1 0];
b = [1; 5; 6];

A = [1 1 0; 0 1 1; 1 2 1; 1 0 1];
b = [2; 2; 3; 4];
ATA = A'*A;
ATb = A'*b;

[x_star,eucl_norm, SE, RMSE] = leastSquares(A,b);