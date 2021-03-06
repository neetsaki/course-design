function [mu,eta_w] = viscosity(w,T,p_sat)
%不同温度下的粘度拟合mu(Pa*s),T(K)w4
%ref: dx.doi.org/10.1134/S0018151X12030029
%eta_ref为相对粘度,eta_w为水的粘度(Pa*s),eta_sol为溶液粘度(Pa*s),p_sat为该温度下水饱和蒸汽压（MPa）,w为盐质量浓度(kg/kg),T(K)
%m(mol(kg of water)),T(K)
m=w*1000/58.5/(1-w);
tau=400/T;
tau_water=293.15/T-1;
p=101.325/1000;
p_water=p-p_sat;
A00=7.65306227*10^-1;
A01=-1.78087723;
A11=-1.39287121*10^-2;
A02=1.25374926;
A12=1.50838568*10^-2;
A03=-1.61102861*10^-1;
A13=3.08379974*10^-3;
A04=-7.27978696*10^-2;
A14=-5.27719410*10^-3;

B00=0;
B01=9.84225044*10^-2;
B11=2.22367778*10^-2;
B02=2.43031313*10^-1;
B12=-3.68121974*10^-2;
B03=-2.05007685*10^-1;
B13=1.57724556*10^-2;
C00=0;
C01=1.62231138*10^-1;
C11=-5.78612528*10^-3;
C02=-2.91448434*10^-1;
C12=9.45954845*10^-3;
C03=1.31605764*10^-1;
C13=-3.96672431*10^-3;
D00=0;
D01=-2.08142179*10^-2;
D11=5.49316850*10^-4;
D02=3.80923122*10^-2;
D12=-9.01751419*10^-4;
D03=-1.66477653*10^-2;
D13=3.77212002*10^-4;

c0=0;
c1=5.17341030;
c2=9.81838817;
c3=2.83021985*10;
c4=7.02071954*10;
c5=-9.92041252*10^2;
c6=-1.13267055*10^4;
c7=-5.10988292*10^4;
c8=-1.18863488*10^5;
c9=-1.41053273*10^5;
c10=-6.78490604*10^4;

d0=-3.18833435*10^-1;
d1=-1.07314454*10;
d2=-8.61347656*10;
d3=-6.50268842*10^2;
d4=-6.06767730*10^3;
d5=-4.07022741*10^4;
d6=-1.59650983*10^5;
d7=-3.53438962*10^5;
d8=-4.11357235*10^5;
d9=-1.96118714*10^5;

A=A00+A01*p^0*tau^1+A02*p^0*tau^2+A03*p^0*tau^3+A04*p^0*tau^4+A11*p^1*tau^1+A12*p^1*tau^2+A13*p^1*tau^3+A14*p^1*tau^4;
B=B00+B01*p^0*tau^1+B02*p^0*tau^2+B03*p^0*tau^3+B11*p^1*tau^1+B12*p^1*tau^2+B13*p^1*tau^3;
C=C00+C01*p^0*tau^1+C02*p^0*tau^2+C03*p^0*tau^3+C11*p^1*tau^1+C12*p^1*tau^2+C13*p^1*tau^3;
D=D00+D01*p^0*tau^1+D02*p^0*tau^2+D03*p^0*tau^3+D11*p^1*tau^1+D12*p^1*tau^2+D13*p^1*tau^3;
eta_ref=1+A*m^0.5+B*m+C*m^2+D*m^3;
c=c0+c1*tau_water+c2*tau_water^2+c3*tau_water^3+c4*tau_water^4+c5*tau_water^5+c6*tau_water^6+c7*tau_water^7+c8*tau_water^8+c9*tau_water^9+c10*tau_water^10;
d=d0+d1*tau_water+d2*tau_water^2+d3*tau_water^3+d4*tau_water^4+d5*tau_water^5+d6*tau_water^6+d7*tau_water^7+d8*tau_water^8+d9*tau_water^9;
eta_w=1001.6*(tau_water+1)^2*exp(c)+p_water*d;
mu=eta_ref*eta_w*1e-6;
eta_w=eta_w*1e-6;
end

