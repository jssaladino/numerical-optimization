% Joanna Grace Saladino
% Math 288: Numerical Optimization
% The exact questions can be read in NumOpt2.pdf
% Golden Search Method (GSM)

function alpha = GSM(f, w, nVars, index)

a=-1; b=1;
alpha = b;
tol = 1e-7; 
p=(3-sqrt(5))/2; 
e=eye(nVars,nVars);

g=@(alpha) f(w + alpha*e(index,:));

 while abs(b-a)> tol
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
