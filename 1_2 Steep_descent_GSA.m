% Joanna Grace Saladino
% Math 288: Numerical Optimization
% This code finds the local minima of a certain function using steepest 
% descent and golden search algorithm
% The exact question is in the NumOpt1.pdf
% Item 2


clear; clc;
eps= 10e-7; 
      
F= @(X) 2.*X(1, :).^2 - 1.05.*X(1,:).^4 + (X(1,:).^6)/6 + X(1,:).*X(2,:) + X(2,:).^2;
DF= @(X) [4.*X(1,:)- 4.2.*X(1,:).^3 + X(1,:).^5 + X(2,:); ...
          X(1,:) + 2.*X(2,:)  ];
      
X1=steepestdescent(F,DF, [1.5; 1.5], eps);
X2=steepestdescent(F,DF, [0; 1.5], eps);
X3=steepestdescent(F,DF, [-1; 1.5], eps);

figure('Name','Contour in 3D');
% Plot in 3D
plot3(X1(1, :),X1(2, :), F(X1)); hold on
plot3(X2(1, :),X2(2, :), F(X2)); hold on
plot3(X3(1, :),X3(2, :), F(X3)); hold on

[W,V] = meshgrid(-2:.2:2);                                
Z = 2.*W.^2 - 1.05.*W.^4 + (W.^6)/6 + W.*V + V.^2;
contour3(W,V,Z, 40); hold on
rotate3d on;

figure('Name','Contour in 2D');
% Plot in 2D
plot(X1(1, :),X1(2, :)); hold on
plot(X2(1, :),X2(2, :)); hold on
plot(X3(1, :),X3(2, :)); hold on

[W,V] = meshgrid(-2:.2:2);                                
Z = 2.*W.^2 - 1.05.*W.^4 + (W.^6)/6 + W.*V + V.^2;
contour3(W,V,Z, 40); hold on


%  Steepest Descent Function

function x = steepestdescent(f,df, x0, eps)
k=1; 
x(:,k)= x0;
d(:,k)= df(x(:,k));
a(:,k)= gsearch(f, df, 0, 1, x(:,k));
x(:,k+1)= x(:,k) - a(:,k)*d(:,k); 
err= norm(x(:,k+1)- x(:,k));

while (err >= eps) && (norm(df(x(:,k+1)))>=eps)
     k=k+1;
     d(:,k)= df(x(:,k));
     a(:,k)= gsearch(f, df, 0,1, x(:,k));
     x(:,k+1)= x(:,k) - a(:,k)*d(:,k);
     err= norm(x(:,k+1)- x(:,k)); 
end
end


% Golden Search Algorithm
function alpha = gsearch(f, df, a, b, x)

alpha=b;
g=@(alpha) f(x-alpha*df(x));
p=(3-sqrt(5))/2; 

while abs(b-a)> eps
    c=a + p*(b-a);
    d= a + (1-p)*(b-a);
    if g(c)<= g(d)
        b=d;
    else 
        a=c;
    end 
end
alpha = (a+b)/2; 
end 