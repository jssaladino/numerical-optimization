% Joanna Grace Saladino
% Math 288: Numerical Optimization
% Questions are in NumOpt2.pdf
% Item 4
% Simulated Annealing and Nelder mead Simplex Method (Hybrid)

clear;clc
N =500; %initial population
Xdata = [1000; 2588; 4368; 1758; 293; 73; 33;24; 36];

inGuess= [0 0 1]; 

fmin= @(K) .5*sum((X1(K) - Xdata).^2)./sum(Xdata.^2);

LB = [0 0 0];
UB = [0.01 0.01 1];

disp('Estimating the values of k1, k2, k3 using ');
disp('Simulated Annealing we get:');
s = simulannealbnd(fmin, inGuess, LB, UB)

disp('To further improve this estimation, we will the perform')
disp('the Nelder-Mead Simplex Method using the value of s')
disp('as its starting, and with this we get')

Kmin = fminsearch(fmin, s)







  



