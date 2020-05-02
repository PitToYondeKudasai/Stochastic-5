figure;
plot(data(:,1), data(:,2), '-bo','MarkerEdgeColor','r','LineWidth', 2, 'DisplayName', 'Original points')
title('World Crude Oil Production by Year');
xlabel('Year');
ylabel('Thousand Barrels per Day');
%ylim([30000 90000]);


%Creating matrices A and b to use leastSquares solution
m = size(data, 1);
A = ones(m, 4);
x = data(:,1);
A(:,2) = x;
b = data(:,2);
%[alpha_star,eucl_norm, SE, RMSE] = leastSquares(A, b);
[p, ~, delta] = polyfit(x, b, 1);
hold on;
plot(x, polyval(p, x), '-g', 'DisplayName', 'Polifit model');
legend off;
dim = [.2 .6 .3 .3];
text = split(sprintf('Residuals'' metrics\nDelta: %.1f', norm(delta)), '\n');
annotation('textbox', dim, 'String', text, 'FitBoxToText','on');
hold off;