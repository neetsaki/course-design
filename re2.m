clc
clear
%给定流速u1.u2(m/s),中间温度T(degree)
u1=0.7;
u2=0.7;
T=94;

%97.3kPa 饱和水蒸气温度T_sat @@@@
T_sat=120;
%35度此卤水盐质量分数w(kg/kg)
w=1/1180*293.76;
%产量Q kg/s
Q=100/3600*1000;
%饱和食盐水在水相和固相分配比例alpha1,饱和食盐水的质量分率w_sat(kg/m3),盐密度rho_salt(kg/m3)
w_sat=26.7;
rho_salt=2200;
alpha1=0.4*w_sat/(0.6*rho_salt);
%流量V(m3/s),293.76 kg/m3
V=Q*(1+alpha1)/293.76*0.28;
%单根管截面积a0(m2),总面积A(m2)
a0=pi*0.032^2/4;
a1=V/u1;
a2=V/u2;
%所需管数n1,n2
n1=a1/a0;n2=a2/a0;

%两换热器定性温度
T1=(83+T)/2;
T2=(105+T)/2;
%不同温度下密度数据拟合(kg/dm3)
rho_1=density(100*w,T1);
rho_2=density(100*w,T2);
%不同温度下的比热容拟合cp（kJ/(kg*degree)）
cp1=capacity(T1,w);
cp2=capacity(T2,w);
%不同温度下水饱和蒸汽压拟合p_sat(kPa)
p_sat1=p_sat(T1);
p_sat2=p_sat(T2);
%不同温度下卤水导热系数拟合k
k1=k(T1);
k2=k(T2);
%两管壁温度
T_pine1=T_pine(T,u1);
T_pine2=T_pine(T,u2);
%两管壁定性温度
T_m1=(T_sat+T_pine1)/2;
T_m2=(T_sat+T_pine2)/2;
%不同温度下水密度拟合rho_water(kg/m3)
rho_water1=rho_water(T_m1);
rho_water2=rho_water(T_m2);
%不同温度下水的蒸发焓拟合H_vap(kJ/kg)
H_vap1= H_vap(T_m1);
H_vap2= H_vap(T_m2);
%不同温度下水导热系数k_water(W/(m*degree))
k_water1=k_water(T_m1);
k_water2=k_water(T_m2);
%不同温度下水蒸气密度拟合(kg/(m3))
rho_vapor1=0;
rho_vapor2=0;
%rho_vapor1=rho_vapor(T_m1);
%rho_vapor2=rho_vapor(T_m2);

%不同温度下的粘度拟合mu(Pa*s) 
[mu1,~]=viscosity(w,T1+273.15,p_sat1*1e-3);
[mu2,~]=viscosity(w,T2+273.15,p_sat2*1e-3);
%H_vap蒸发焓（kJ/kg）,凝液质量流率omega（kg/s）,蒸汽冷凝雷诺数Re_f
omega1=V*rho_1*1e3/n1*cp1*(T-83)/H_vap1;
[~,mu_water_1]=viscosity(w,T_pine1+273.15,p_sat(T_m1)*1e-3);
Re_f1=4*omega1/(pi*0.038*mu_water_1);
omega2=V*rho_2*1e3/n2*cp2*(105-T)/H_vap2;
[t,mu_water_2]=viscosity(w,T_pine2+273.15,p_sat(T_m2)*1e-3);
Re_f2=4*omega2/(pi*0.038*mu_water_2);
%两管内对流传热系数(W/(m2*degree))
alpha_i1 =alpha_in(rho_1,k1,u1,mu1,cp1*1e3);
alpha_i2 =alpha_in(rho_2,k2,u2,mu2,cp2*1e3);
%两管外冷凝传热系数
alpha_o1=alpha_out(Re_f1,rho_water1,rho_vapor1,mu_water_1,H_vap1,k_water1,T_sat,T_pine1);
alpha_o2=alpha_out(Re_f2,rho_water2,rho_vapor2,mu_water_2,H_vap2,k_water2,T_sat,T_pine2);
%给一个建议的初值，待查
%alpha_o1=
%给一个建议的初值，待查
%alpha_o2=
%选用管的传热系数k_pine(W/(m*degree)),污垢系数Rsi,Rso,对数平均直径d_m
k_pine=20
Rsi=0.0002;
Rso=0.0001;
d_m=(0.038-0.032)/(log(0.038)-log(0.032));

%总传热系数K(W/(m2*degree)) 对数平均温度t_m
K1=(0.038/(alpha_i1*0.032)+Rsi*0.038\0.032+0.003*0.038/d_m+Rso+alpha_o1)^-1;
K2=(0.038/(alpha_i2*0.032)+Rsi*0.038\0.032+0.003*0.038/d_m+Rso+alpha_o2)^-1;
t_m1=(T-83)/(log(T)-log(83));   
t_m2=(105-T)/(log(105)-log(T));
%所需换热面积
S1=V*rho_1*cp1*(T-83)/(K1*t_m1);
S2=V*rho_2*cp2*(105-T)/(K2*t_m2);
%管长L
%@@@@@@@@@@@@@@这里S 应该指的是管外的面积
L1=S1/(2*pi*0.032*n1)
L2=S2/(2*pi*0.032*n2)


%opt task: S_min,偏近标准


