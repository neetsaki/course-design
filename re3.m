clc
clear
%��������u1.u2(m/s),�м��¶�T(degree)
u1=0.7;
u2=0.7;
u3=0.7;
T_a=90;
T_b=97;

%97.3kPa ����ˮ�����¶�T_sat @@@@
T_sat=120;
%35�ȴ�±ˮ����������w(kg/kg)
w=1/1180*293.76;
%����Q kg/s
Q=100/3600*1000;
%����ʳ��ˮ��ˮ��͹���������alpha1,����ʳ��ˮ����������w_sat(kg/m3),���ܶ�rho_salt(kg/m3)
%w_sat=26.7;
w_sat=389.4;
rho_salt=2200;
alpha1=0.4*w_sat/(0.6*rho_salt);
%����V(m3/s),293.76 kg/m3
V=Q*(1+alpha1)/293.76*0.28;
%�����ܽ����a0(m2),�����A(m2)
a0=pi*0.032^2/4;
a1=V/u1;
a2=V/u2;
a3=V/u3;
%�������n1,n2
n1=a1/a0;n2=a2/a0;n3=a3/a0;

%�������������¶�
T1=(83+T_a)/2;
T2=(T_a+T_b)/2;
T3=(T_b+105)/2;
%��ͬ�¶����ܶ��������(kg/dm3)
rho_1=density(100*w,T1);
rho_2=density(100*w,T2);
rho_3=density(100*w,T3);
%��ͬ�¶��µı��������cp��kJ/(kg*degree)��
cp1=capacity(T1,w);
cp2=capacity(T2,w);
cp3=capacity(T3,w);
%��ͬ�¶���ˮ��������ѹ���p_sat(kPa)
p_sat1=p_sat(T1);
p_sat2=p_sat(T2);
p_sat3=p_sat(T3);
%��ͬ�¶���±ˮ����ϵ�����k
k1=k(T1);
k2=k(T2);
k3=k(T3);
%���ܱ��¶�
T_pine1=T_pine_new(83,T_a,u1);
T_pine2=T_pine_new(T_a,T_b,u2);
T_pine3=T_pine_new(T_b,105,u3);
%���ܱڶ����¶�
T_m1=(T_sat+T_pine1)/2;
T_m2=(T_sat+T_pine2)/2;
T_m3=(T_sat+T_pine3)/2;
%��ͬ�¶���ˮ�ܶ����rho_water(kg/m3)
rho_water1=rho_water(T_m1);
rho_water2=rho_water(T_m2);
rho_water3=rho_water(T_m3);
%��ͬ�¶���ˮ�����������H_vap(kJ/kg)
H_vap1= H_vap(T_m1);
H_vap2= H_vap(T_m2);
H_vap3= H_vap(T_m3);
%��ͬ�¶���ˮ����ϵ��k_water(W/(m*degree))
k_water1=k_water(T_m1);
k_water2=k_water(T_m2);
k_water3=k_water(T_m3);
%��ͬ�¶���ˮ�����ܶ����(kg/(m3))
rho_vapor1=0;
rho_vapor2=0;
rho_vapor3=0;
%rho_vapor1=rho_vapor(T_m1);
%rho_vapor2=rho_vapor(T_m2);
%rho_vapor3=rho_vapor(T_m3);

%��ͬ�¶��µ�ճ�����mu(Pa*s) 
[mu1,~]=viscosity(w,T1+273.15,p_sat1*1e-3);
[mu2,~]=viscosity(w,T2+273.15,p_sat2*1e-3);
[mu3,~]=viscosity(w,T3+273.15,p_sat3*1e-3);
%H_vap�����ʣ�kJ/kg��,��Һ��������omega��kg/s��,����������ŵ��Re_f
omega1=V*rho_1*1e3/n1*cp1*(T_a-83)/H_vap1;
[~,mu_water_1]=viscosity(w,T_pine1+273.15,p_sat(T_m1)*1e-3);
Re_f1=4*omega1/(pi*0.038*mu_water_1);
omega2=V*rho_2*1e3/n2*cp2*(T_b-T_a)/H_vap2;
[t,mu_water_2]=viscosity(w,T_pine2+273.15,p_sat(T_m2)*1e-3);
Re_f2=4*omega2/(pi*0.038*mu_water_2);
omega3=V*rho_3*1e3/n3*cp3*(105-T_b)/H_vap3;
[t,mu_water_3]=viscosity(w,T_pine3+273.15,p_sat(T_m3)*1e-3);
Re_f3=4*omega3/(pi*0.038*mu_water_3);
%�����ڶ�������ϵ��(W/(m2*degree))
alpha_i1 =alpha_in(rho_1,k1,u1,mu1,cp1*1e3);
alpha_i2 =alpha_in(rho_2,k2,u2,mu2,cp2*1e3);
alpha_i3 =alpha_in(rho_3,k3,u3,mu3,cp3*1e3);
%��������������ϵ��
alpha_o1=alpha_out(Re_f1,rho_water1,rho_vapor1,mu_water_1,H_vap1,k_water1,T_sat,T_pine1);
alpha_o2=alpha_out(Re_f2,rho_water2,rho_vapor2,mu_water_2,H_vap2,k_water2,T_sat,T_pine2);
alpha_o3=alpha_out(Re_f3,rho_water3,rho_vapor3,mu_water_3,H_vap3,k_water3,T_sat,T_pine3);
%��һ������ĳ�ֵ������
%alpha_o1=
%��һ������ĳ�ֵ������
%alpha_o2=
%ѡ�ùܵĴ���ϵ��k_pine(W/(m*degree)),�۹�ϵ��Rsi,Rso,����ƽ��ֱ��d_m
k_pine=20
Rsi=0.0002;
Rso=0.0001;
d_m=(0.038-0.032)/(log(0.038)-log(0.032));

%�ܴ���ϵ��K(W/(m2*degree)) ����ƽ���¶�t_m
K1=(0.038/(alpha_i1*0.032)+Rsi*0.038\0.032+0.003*0.038/d_m+Rso+alpha_o1)^-1;
K2=(0.038/(alpha_i2*0.032)+Rsi*0.038\0.032+0.003*0.038/d_m+Rso+alpha_o2)^-1;
K3=(0.038/(alpha_i3*0.032)+Rsi*0.038\0.032+0.003*0.038/d_m+Rso+alpha_o3)^-1;
t_m1=(T_a-83)/(log(T_a)-log(83));   
t_m2=(T_b-T_a)/(log(T_b)-log(T_a));
t_m3=(105-T_b)/(log(105)-log(T_b));
%���軻�����
S1=V*rho_1*cp1*(T_a-83)/(K1*t_m1);
S2=V*rho_2*cp2*(T_b-T_a)/(K2*t_m2);
S3=V*rho_3*cp2*(105-T_b)/(K3*t_m3);
%�ܳ�L
%@@@@@@@@@@@@@@����S Ӧ��ָ���ǹ�������
L1=S1/(2*pi*0.032*n1)
L2=S2/(2*pi*0.032*n2)
L3=S3/(2*pi*0.032*n3)


%opt task: S_min,ƫ����׼


