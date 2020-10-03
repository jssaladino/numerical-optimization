% Joanna Grace Saladino
% Math 288: Numerical Optimization
% The exact questions can be read in NumOpt2.pdf
% Coordinate descent method (CDM)
% Item 1

load('InitialGuess.mat')

F1=@(x)  100*(x(2) - x(1)^2)^2 + (x(1) -1)^2;
F2=@(x) 100*(abs(x(2) - 0.01*x(1)^2))^.5 + 0.01*abs(x(1) +10);
F3=@(x) x(1)*sin(4*x(1)) + 1.1*x(2)*sin(2*x(2));
 

F1_min = zeros(10,2);
F2_min = zeros(10,2);
F3_min = zeros(10,2);

for iter=1:10
    [F1_min(iter,:), F1val(iter)] = CDM(F1,InGuess1(iter, :), 2);
    [F2_min(iter,:), F2val(iter)] = CDM(F2,InGuess2(iter, :),2);
    [F3_min(iter,:), F3val(iter)] = CDM(F3,InGuess3(iter, :),2);
end


F1_ave =  sum(F1_min,1)/10
k1 = find(F1val==min(F1val));
F1_best= F1_min(k1,:)

F2_ave =  sum(F2_min,1)/10
k2 = find(F2val==min(F2val));
F2_best= F2_min(k2,:)

F3_ave =  sum(F3_min,1)/10
k3 = find(F3val==min(F3val));
F3_best= F3_min(k3,:)

%save('CDM.mat');