function rho=rho_water(x)
%��ͬ�¶���ˮ�ܶ����rho_water(kg/m3),x:T(degree)
      p1 =   9.393e-06;
      p2 =   -0.004977;
      p3 =    -0.01513;
      p4 =        1000;
 rho= p1*x^3 + p2*x^2 + p3*x + p4;
end

