function Y = fncsys(t, X, K)
k1=3;
Y =[k1*X(1) - K(1)*X(1)*X(2);...
    K(2)*X(1)*X(2) - K(3)*X(2)];
 
end 