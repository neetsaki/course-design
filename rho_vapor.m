function f=rho_vapor(x)
%不同温度下水蒸气密度拟合(kg/(m3)),x:T(degree)
p1 =   1.117e-06;
p2 =  -8.025e-05;
p3 =    0.002997;
p4 =    -0.01008;  
 f=p1*x^3 + p2*x^2 + p3*x + p4;
end

