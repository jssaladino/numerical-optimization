% Joanna Grace Saladino
% Math 288: Numerical Optimization
% This code contains the conjugate gradient method
% The exact question is in the NumOpt1.pdf
% Item 7

% Conjugate Gradient 



nmax=100;
tol= 1e-7;

X=[20; 16; 19.79999924; 18.39999962; 17.10000038; 15.5; 14.69999981; ...
    17.10000038; 15.39999962; 16.20000076; 15; 17.20000076; 16;17; 14.39999962];
Y=[88.59999847; 71.59999847; 93.30000305; 84.30000305; 80.59999847; ...
    75.19999695; 69.69999695; 82; 69.40000153; 83.30000305; 79.59999847;...
    82.59999847; 80.59999847; 83.5; 76.30000305];
A=[X ones(15,1)];
Q=A'*A; 
b=A'*Y;

c=cgm(Q, b, tol, nmax);
disp('The minimizer of f(c1, c2) is');
c

disp('The estimated temperature if the striped ground cricket chirped');
disp('19 times in one second is');
est_temp=c(1)*19 + c(2)

x=linspace(14, 20, 100);
plot(x, c(1)*x + c(2)); hold on
scatter(X,Y, 'filled');


% To check 
% f=@(x) .5*x'*Q*x - b'*x;
% xtrue = fminunc(f, [0;0])



function c = cgm(Q, b, tol, nmax)
c=[0;0];

k=1;
g(:, k)= -(Q*c(:, k) - b); 
d(:, k)= g(:, k); 
alpha(:,k)= quad_inter(Q, b, c(:, k), d(:, k), 0, 1);

c(:, k+1)= c(:, k) + alpha(:,k)*d(:, k);
err= norm(g(:,k));

while ((err >= tol) && (k<= nmax))
   g(:, k+1)= g(:, k) - alpha(:,k)*Q*d(:, k); 
   beta(:, k)= (g(:, k+1)'*g(:, k+1))./((g(:, k)'*g(:, k)));
   d(:, k+1)= - g(:, k+1)+ beta(:, k)*d(:, k);
   
   k=k+1;
   alpha(:,k)= quad_inter(Q, b, c(:, k), d(:, k), 0, 1);
   c(:, k+1)= c(:, k) + alpha(:,k)*d(:, k);
   err= norm(g(:,k));
end

c=c(:,k);
 
end 


function alpha = quad_inter(Q, b, x, d, amin, amax)
f=@(alpha) (1/2)*(x+alpha*d)'*Q*(x + alpha*d) - (x+alpha*d)'*b ;

check=0;
while check ~= 1  
a=2*rand(1,1)-1;
    if (f(a) <= f(amin)) || (f(a) <= f(amax))
        check =1; 
    else
        check=0;
    end
end 

A=[amin^2 amin 1; amax^2 amax 1; a^2 a 1]; 
b=[f(amin); f(amax); f(a)]; 

beta= A\b; 

alpha= -beta(2)/(2*beta(1));

end

