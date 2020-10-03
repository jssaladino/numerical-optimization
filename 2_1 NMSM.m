% Joanna Grace Saladino
% Math 288: Numerical Optimization
% The exact questions can be read in NumOpt2.pdf
% Nelder Mead Simplex Method
% Item 1


clear; clc;
T1=readtable('f1_initial_points.xls');
T2=readtable('f2_initial_points.xls');
T3=readtable('f3_initial_points.xls');

mu=1000; 

F1=@(x) 100*(x(2) - x(1)^2)^2 + (x(1) -1)^2 +...
        mu*(max(0, -30-x(1)) + max(0, -30-x(2)) + max(0, x(1) -30) + max(0, x(2) -30) ) ;
InPoint1= table2array(T1);


F2=@(x) 100*(abs(x(2) - 0.01*x(1)^2))^.5 + 0.01*abs(x(1) +10) +...
         mu*(max(0, -15-x(1)) + max(0, -3-x(2)) + max(0, x(1)+5) + max(0, x(2)-3));
InPoint2= table2array(T2);


F3=@(x) x(1)*sin(4*x(1)) + 1.1*x(2)*sin(2*x(2)) + ... 
        mu*(max(0,-x(1)) + max(0,-x(2)) + max(0, x(1)-10) + max(0, x(2)-10));;
InPoint3= table2array(T3);


F1_min = zeros(10,2);
F2_min = zeros(10,2);
F3_min = zeros(10,2);

for iter=1:10
    [F1_min(iter,:), F1val(iter)] = fminsearch(F1,InPoint1(iter, :));
    [F2_min(iter,:), F2val(iter)] = fminsearch(F2,InPoint2(iter, :));
    [F3_min(iter,:), F3val(iter)] = fminsearch(F3,InPoint3(iter, :));
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

%save('NMSM.mat');