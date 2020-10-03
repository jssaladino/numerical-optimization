function Z = X1(K)
[t, Y] = ode45(@(t,Y) fncsys(t, Y, K),0:0.5:4,[1000;500]);
Z = Y(:,1);
end