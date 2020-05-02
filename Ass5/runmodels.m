clc;
clear;
close all;
filename = 'WorldCrudeOilProduction.csv';
fprintf('Reading the data: ''%s''\n', filename);
fulldata = readmatrix(filename);
data = fulldata(1:end-1,:); %years 1980-2014

year_forecast = 2015;

allmodelsinaplot;
linearModel;
quadraticModel;
cubicModel;

figure(hr);
legend('Location', 'southeast');
fprintf('Year 2015 real value: %.1f\n', fulldata(end:end, end:end))