figure;
plot(data(:,1), data(:,2), '-bo','MarkerEdgeColor','r','LineWidth', 2, 'DisplayName', 'Original points')
title('World Crude Oil Production by Year');
xlabel('Year');
ylabel('Thousand Barrels per Day');
%ylim([0 90000]);


%Creating matrices A and b to use leastSquares solution
m = size(data, 1);
A = ones(m, 3);
A(:,2) = data(:,1);
A(:,3) = data(:,1).^2;
b = data(:,2);
[alpha_star,eucl_norm, SE, RMSE] = leastSquares(A, b);
hold on;
plot(data(:,1), A * alpha_star, '-g', 'DisplayName', 'Quadratic model');
legend;
dim = [.2 .6 .3 .3];
text = split(sprintf('Residuals'' metrics\nEuclidian norm: %.1f\nSE: %.4e\nRMSE: %.1f', eucl_norm, SE, RMSE), '\n');
annotation('textbox', dim, 'String', text, 'FitBoxToText','on');
hold off;

figure(hr);
hold on;
plot(data(:,1), A * alpha_star, '-', 'DisplayName', 'Quadratic model');
hold off;

%calculating for 2015
A_qm = ones(1,2);
A_qm(:,2) = year_forecast;
A_qm(:,3) = year_forecast^2;
fprintf('Year 2015 forecast with quadratic model = %.1f\n', A_qm * alpha_star);