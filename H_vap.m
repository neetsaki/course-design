function H =H_vap(x)
%不同温度下水的蒸发焓拟合H_vap(kJ/kg),x:T(degree)
       p1 =  -1.532e-05;
       p2 =   0.0008958;
       p3 =      -2.269;
       p4 =        2491;
       H=p1*x^3 + p2*x^2 + p3*x + p4;
end

