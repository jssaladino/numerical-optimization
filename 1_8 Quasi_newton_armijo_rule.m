% Joanna Grace Saladino
% Math 288: Numerical Optimization
% The exact question is in the NumOpt1.pdf
% This code uses armijo rule and quasi newton method 
% Item 8


clear; clc;
nmax=100;  % This should be 100
tol=1e-7;

F1= @(X)  X(1)- X(1)*X(2) - 1.5;
F2= @(X)  X(1)- X(1)*X(2).^2 - 2.25;
F3= @(X)  X(1)- X(1)*X(2).^3 - 2.625;

f=@(X) (1/2)*(F1(X)^2 + F2(X)^2  + F3(X)^2);

G1=@(X) (X(1)- X(1)*X(2) - 1.5)*(1-X(2)) + (X(1)- X(1)*X(2).^2 - 2.25)*(1-X(2)^2) + (X(1)- X(1)*X(2)^3 - 2.625)*(1-X(2)^3);
G2=@(X) (X(1)- X(1)*X(2) - 1.5)*X(1) + 2*(X(1)- X(1)*X(2)^2 - 2.25)*(X(1)*X(2)) + 3*(X(1)- X(1)*X(2).^3 - 2.625)*(X(1)*X(2)^2);
g= @(X) 2*[G1(X); -G2(X)];
        

k=1;
x(:,1)= [0;0];
D = eye(2,2);
dk= -D*g(x(:,k));
alpha(:,k)= armijo(f, g, x(:,k));
x(:, k+1)= x(:,k) + alpha(:,k)*dk;
err= norm(x(:,k+1)- x(:,k));

while (err >= tol) && (k<=nmax)
    p= x(:,k+1)- x(:,k);
    q= g(x(:,k+1))- g(x(:,k));
    
    xi=1;
    tau=q'*D*q;
    v= p/(p'*q) -(D*q)/tau;
    Dk = D + (p*p')/(p'*q) - (D*q*q'*D)/(q'*D*q) + xi*tau*(v*v');
    
    k=k+1;
    dk= -Dk*g(x(:,k));
    alpha(:,k)= armijo(f, g, x(:,k));
    x(:, k+1)= x(:,k) + alpha(:,k)*dk;
    err= norm(x(:,k+1)- x(:,k));
end 

xmin= x(:,k)


% To check 
% xtrue = fminunc(f,x(:,1))


function ak= armijo(f, df, xk)
beta=0.5;  
s=1;
sigma=0.2;
check=0;
m=0;
dk=-df(xk);

while check ~= 1 
ak = (beta^m)*s;
    if  f(xk + ak*dk) <= f(xk) + sigma*ak*df(xk)'*dk
        check =1;
    else 
        m=m+1;
        check=0;
    end 
end

end