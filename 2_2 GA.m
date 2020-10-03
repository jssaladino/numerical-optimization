% Joanna Grace Saladino
% Math 288: Numerical Optimization
% Questions are in NumOpt2.pdf
% Item 2
% Genetic Algorithm 
% Cholesky Factorization

clear;clc;

A =[2 -2 0;-2 4 2; 0 2 3];
Amax = max(reshape(A, [1 9])); 
LB = -Amax*ones(1,6);   
UB =  Amax*ones(1,6);
nvars = 6; 

func=@(x)  norm(A - [x(1)*x(1) x(1)*x(2) x(1)*x(4);...
                     x(1)*x(2) (x(2)^2+ x(3)^2) x(2)*x(4)+x(5)*x(3);...
                     x(1)*x(4) x(2)*x(4)+x(5)*x(3) (x(4)^2+x(5)^2+x(6)^2)], ...
                'fro'); 


x = ga(func,nvars,[],[],[],[],LB,UB);

disp('The Cholesky factorization of A is')
L = [x(1) 0 0; x(2) x(3) 0; x(4) x(5) x(6)]
Lt= L'

disp('Multiplying L and L^T we get')
%To check 
LLt= L*L'
