function cp=capacity(x,y)
%不同温度下的比热容拟合cp（kJ/(kg*degree)）,x:T(degree),y:w(%)
p00 =       4.153;
p10 =    0.001236;
p01 =    -0.05371;
p20 =   3.603e-06;
p11 =  -1.312e-05;
p02 =    0.001098;
p21 =    -2.6e-07;
p12 =   7.091e-08;
p03 =  -1.404e-05;
cp=p00+p10*x+p01*y+p20*x^2+p11*x*y+p02*y^2 + p21*x^2*y+p12*x*y^2 +p03*y^3;
end

