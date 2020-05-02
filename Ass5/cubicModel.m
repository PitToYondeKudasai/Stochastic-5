figure;
plot(data(:,1), data(:,2), '-bo','MarkerEdgeColor','r','LineWidth', 2, 'DisplayName', 'Original points')
title('World Crude Oil Production by Year');
xlabel('Year');
ylabel('Thousand Barrels per Day');
%ylim([0 90000]);


%Creating matrices A and b to use leastSquares solution
m = size(data, 1);
A = ones(m, 4);
A(:,2) = data(:,1);
A(:,3) = data(:,1).^2;
A(:,4) = data(:,1).^3;
b = data(:,2);
[alpha_star,eucl_norm, SE, RMSE] = leastSquares(A, b);
hold on;
plot(data(:,1), A * alpha_star, '-g', 'DisplayName', 'Cubic model');
legend;
dim = [.2 .6 .3 .3];
text = split(sprintf('Residuals'' metrics\nEuclidian norm: %.1f\nSE: %.4e\nRMSE: %.1f', eucl_norm, SE, RMSE), '\n');
annotation('textbox', dim, 'String', text, 'FitBoxToText','on');
hold off;

%Ploting on the same graph for allplots
figure(hr);
hold on;
plot(data(:,1), A * alpha_star, '-', 'DisplayName', 'Cubic model');
hold off;

%calculating for 2015
A_cm = ones(1,2);
A_cm(:,2) = year_forecast;
A_cm(:,3) = year_forecast^2;
A_cm(:,4) = year_forecast^3;

fprintf('Year 2015 forecast with cubic model = %.1f\n', A_cm * alpha_star);