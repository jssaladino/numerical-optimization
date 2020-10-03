% Joanna Grace Saladino
% Math 288: Numerical Optimization
% Questions are in NumOpt2.pdf
% Item 3
% Coordinate Descent method

clear;clc;
nVars=3;
mu=1000;
r = [1;2;3];
p = [10;12;15];


f = @(k) .5*norm(p - (k(1).*exp(k(2).*r) + k(3).*r))^2 +...
         mu*(max(0,-k(2)) + max(0, k(3)));

k=[0 0 0];
[k fval]= CDM(f, k, nVars);

disp('The estimated values of k1, k2, k3 is'); 
k

% k= [8.7713    0.2597   -1.3723];

disp('Hence, the minimum size of circular plate that would')
disp('be required to sustain a load of 500/lb is');

g = @(r) .5*norm(500 - (k(1).*exp(k(2).*r) + k(3).*r))^2; 
r = CDM(g, 0, 1)

