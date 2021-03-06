function rho= density(x,y)
% 不同温度下密度数据拟合结果,x:w(%),y:T
p00 = 1.001;
p10 = 0.007291;
p01 = -6.573*1e-05;
p20 = 2.425*1e-05;
p11 = -1.793*1e-05;
p02 = -4.159*1e-06;
p21 = 7.498*1e-08;
p12 = 1.017*1e-07;
p03 =   5.828*1e-09;
rho=p00 + p10*x + p01*y + p20*x^2 + p11*x*y + p02*y^2 + p21*x^2*y + p12*x*y^2+p03*y^3;
end

