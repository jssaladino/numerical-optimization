% Joanna Grace Saladino
% Math 288: Numerical Optimization
% Questions are in NumOpt2.pdf
% Item 1
% Simulated Annealing

clear; clc;
T1=readtable('f1_initial_points.xls');
T2=readtable('f2_initial_points.xls');
T3=readtable('f3_initial_points.xls');


F1=@(x) 100*(x(2) - x(1)^2)^2 + (x(1) -1)^2;
InPoint1= table2array(T1);
LB1 = [-30 -30];   
UB1= [30 30];  

F2=@(x) 100*(abs(x(2) - 0.01*x(1)^2))^.5 + 0.01*abs(x(1) +10);
InPoint2= table2array(T2);
LB2 = [-15 -5];  
UB2 = [-3 3]; 

F3=@(x) x(1)*sin(4*x(1)) + 1.1*x(2)*sin(2*x(2));
InPoint3= table2array(T3);
LB3 = [0 0];   
UB3 = [10 10];  

F1_min = zeros(10,2);
F2_min = zeros(10,2);
F3_min = zeros(10,2);

for iter=1:10
    [F1_min(iter,:), F1val(iter)] = simulannealbnd(F1,InPoint1(iter, :),LB1,UB1);
    [F2_min(iter,:), F2val(iter)] = simulannealbnd(F2,InPoint2(iter, :),LB2,UB2);
    [F3_min(iter,:), F3val(iter)] = simulannealbnd(F3,InPoint3(iter, :),LB3,UB3);
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

%save('SA.mat');

