% Joanna Grace Saladino
% Math 288: Numerical Optimization
% The exact questions can be read in NumOpt2.pdf
% Coordinate descent method (CDM)

function [xmin, fval] = CDM(f,x0, nVars)
tol = 1e-7;
maxIter= 5000;

k = 1;
x(k,:)= x0;
err = tol + 1;

w = x0;

while (err >= tol) && (k <= maxIter)
    for j = 1:nVars
        x(k+1,j) = x(k, j) + GSM(f, w, nVars, j);
        w(j) = x(k+1,j);
    end   
    err = norm(x(k+1,:)-x(k,:));
    k = k+1;
end

xmin=x(k,:);
fval= f(xmin);

end
