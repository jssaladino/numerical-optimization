% Joanna Grace Saladino
% Math 288: Numerical Optimization
% Questions are in NumOpt2.pdf
% Item 5
% Simulated Annealing

clear;clc;
T=readtable('sphinx_moth_data.xlsx');
Data= table2array(T);
R=Data(:,1);
W=Data(:,2);

f=@(x) sum((R - x(2)*W.^x(1)).^2);

ab = simulannealbnd(f,[0 0]);

disp('The value of a and b is')
ab



WW = linspace(0,8,100); 
scatter(W,R, 'red', 'filled');hold on
plot(WW, ab(2)*WW.^ab(1), 'blue', 'LineWidth', 1.5);  
title('Graph of R=bW^a and the scatter plot of  [W, R]');
xlabel('W');
ylabel('R');
