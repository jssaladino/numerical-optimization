% Joanna Grace Saladino
% Math 288: Numerical Optimization
% The exact question is in the NumOpt1.pdf
% This code uses diminishing step size
% Item 5


n=10; 
h=1/(n-1);
nmax=5000; 
tol= 1e-7;
v1=-1*ones(1,n-2);
v2=2*ones(1,n-1);
A= (1/h)*(diag(v1,-1)+ diag(v2, 0)+ diag(v1,1));
b= (1/h)*[1; zeros(n-3, 1); 2];
g=@(u) (A*u - b);
h=@(u) inv(A);


k=1;
u(:, k)=zeros(n-1,1); 
a(:,k)=10; 
u(:,k+1)= u(:,k) - a(:,k)*h(u(:,k))*g(u(:,k));
err= norm(u(:,k+1)- u(:,k)); 

while (err >= tol) && (k <=nmax)
    k=k+1;
    a(:,k)= 10/k;
    u(:,k+1)= u(:,k) - a(:,k)*h(u(:,k))*g(u(:,k));
    err= norm(u(:,k+1)- u(:,k)); 
end 

U = [1;u(:,k);2]

% Must be linear
X=linspace(0,1,n+1);
plot(X,U);

% To check: 
% Make sure that U is the same with A\b

