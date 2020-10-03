% Joanna Grace Saladino
% Math 288: Numerical Optimization
% This code implements the Newton method
% The exact question is in the NumOpt1.pdf
% Item 3

clc
t0=0; 
tol=1e-7;

fun = @(x) exp(-x.^2);
F= @(t) 2*t -1 - integral(fun, 0, atan(t));
dF=@(t) 2 - exp(-atan(t)^2);


t1 = t0 - F(t0)/dF(t0);
err = norm(t1-t0);
k=1;
while (err >= tol) 
        t0=t1;
        t1 = t0 - F(t0)/dF(t0);
        err = norm(t1-t0);
        k=k+1;
end

y_min= t1;
disp('The minimizer of y(t) is' );
y_min
