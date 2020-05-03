clc;
clear;
close all;
filename = 'TempSwitzerland.csv';
fprintf('Reading the data: ''%s''\n', filename);
fulldata = readmatrix(filename, 'NumHeaderLines',1);

ini_row = find(fulldata(:,1)==1994);

years = fulldata(ini_row:ini_row+1, 2:13);


part = [years(1,4:end) years(2,1:4)];
d1 = datetime(1994,4,1); d2 = datetime(1995,4,1);
d(:,1)= d1:d2;
daily = [year(d), month(d)];
monthly = unique(daily, 'rows');

data = [monthly, monthly(:,1) + monthly(:,2)/12, part'];
dates = datetime(data(:,1),data(:,2),1);
x = data(:,3);
A = ones(size(data,1), 3);
A(:,2:3) = [cos(2*pi*x), sin(2*pi*x)];
b = data(:,4);

plot(dates, b, '-bo','MarkerEdgeColor','r','DisplayName', 'Measured Temperature');
title('Mean-temperature of Northern Switzerland');
xlabel('Date');
ylabel('Mean-temperature in °C');
xtickformat('MMM yyyy')

[alpha_star,eucl_norm, SE, RMSE] = leastSquares(A, b);
hold on;
plot(dates, A * alpha_star, '-g', 'DisplayName', 'Model y=\alpha_1 + \alpha_2cos(2\pix) + \alpha_3sin(2\pix)');
legend;
hold off;
dim = [.2 0.05 .6 .3];
text = split(sprintf('Residuals'' metrics\nEuclidian norm: %.1f\nSE: %.4e\nRMSE: %.1f', eucl_norm, SE, RMSE), '\n');
annotation('textbox', dim, 'String', text, 'FitBoxToText','on');
figure;

A2 = ones(size(data,1), 4);
A2(:,2:4) = [cos(2*pi*x), sin(2*pi*x), cos(4*pi*x)];

plot(dates, b, '-bo','MarkerEdgeColor','r','DisplayName', 'Measured Temperature')
title('Mean-temperature of Northern Switzerland')
xlabel('Date')
ylabel('Mean-temperature in °C')
xtickformat('MMM yyyy')

[alpha_star2,eucl_norm, SE, RMSE] = leastSquares(A2, b);
hold on;
plot(dates, A2 * alpha_star2, '-g', 'DisplayName', 'Model y=\alpha_1 + \alpha_2cos(2\pix) + \alpha_3sin(2\pix) + \alpha_4cos(4\pix)');
legend;
hold off;
dim = [.2 0.05 .6 .3];
text = split(sprintf('Residuals'' metrics\nEuclidian norm: %.1f\nSE: %.4e\nRMSE: %.1f', eucl_norm, SE, RMSE), '\n');
annotation('textbox', dim, 'String', text, 'FitBoxToText','on');
figure;

%Comparison plot


plot(dates, b, '-bo','MarkerEdgeColor','r','DisplayName', 'Measured Temperature')
title('Mean-temperature of Northern Switzerland')
xlabel('Date')
ylabel('Mean-temperature in °C')
xtickformat('MMM yyyy')
hold on;
plot(dates, A * alpha_star, '-g', 'DisplayName', 'Model y=\alpha_1 + \alpha_2cos(2\pix) + \alpha_3sin(2\pix)');
plot(dates, A2 * alpha_star2, '-', 'DisplayName', 'Model y=\alpha_1 + \alpha_2cos(2\pix) + \alpha_3sin(2\pix) + \alpha_4cos(4\pix)');
legend;
hold off;
