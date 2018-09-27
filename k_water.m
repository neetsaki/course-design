function k =k_water(x)
%不同温度下水导热系数k_water(W/(m2*degree)),x:T(degree)
       p1 =   3.504e-06;
       p2 =   -0.001757;
       p3 =      0.2735;
       p4 =       55.04;
       k=(p1*x^3 + p2*x^2 + p3*x + p4)*1e-2;
end

