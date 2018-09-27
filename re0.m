%��������u1.u2(m/s),�м��¶�T(degree)
u1=0.7;
u2=0.7;
T=94;

%97.3kPa ����ˮ�����¶�T_sat @@@@
T_sat=120;
%35�ȴ�±ˮ����������w(kg/kg)
w=100/1180*293.76/100;
%����Q kg/s
Q=100/3600*1000;
%����ʳ��ˮ��ˮ��͹���������alpha1,����ʳ��ˮ����������w_sat(kg/m3),���ܶ�rho_salt(kg/m3)
w_sat=26.7;
rho_salt=2200;
alpha1=0.4*w_sat/(0.6*rho_salt);
%����V(m3/s),293.76 kg/m3
V=Q*(1+alpha1)/293.76;
%�����ܽ����a0(m2),�����A(m2)
a0=pi*0.032^2/4;
a1=V/u1;
a2=V/u2;
%�������n1,n2
n1=a1/a0;n2=a2/a0;

%�������������¶�
T1=(83+T)/2;
T2=(105+T)/2;
%��ͬ�¶����ܶ��������kg/dm3
rho_1=density(w,T1);
rho_2=density(w,T2);
%��ͬ�¶��µı��������cp��kJ/(kg*degree)��
cp1=capacity(T1,w);
cp2=capacity(T2,w);
%��ͬ�¶���ˮ��������ѹ���p_sat
p_sat1=p_sat(T1);
p_sat2=p_sat(T2);
%��ͬ�¶���±ˮ����ϵ�����k
k1=k(T1);
k2=k(T2);
%���ܱ��¶�
T_pine1=T_pine(T,u1);
T_pine2=T_pine(T,u2);
%���ܱڶ����¶�
T_m1=(T_sat+T_pine1)/2;
T_m2=(T_sat+T_pine2)/2;
%��ͬ�¶���ˮ�ܶ����rho_water(kg/m3)
rho_water1=rho_water(T_m1);
rho_water2=rho_water(T_m2);
%��ͬ�¶���ˮ�����������H_vap(kJ/kg)
H_vap1= H_vap(T_m1);
H_vap2= H_vap(T_m2);
%��ͬ�¶���ˮ����ϵ��k_water
k_water1=k_water(T_m1);
k_water2=k_water(T_m2);
%��ͬ�¶���ˮ�����ܶ����(kg/(m3))
rho_vapor1=0;
rho_vapor2=0;
%rho_vapor1=rho_vapor(T_m1);
%rho_vapor2=rho_vapor(T_m2);

%��ͬ�¶��µ�ճ�����mu(mPa*s) 
[mu1,~]=viscosity(w,T1,p_sat1);
[mu2,~]=viscosity(w,T2,p_sat2);
%H_vap�����ʣ�kJ/kg��,��Һ��������omega��kg/s��,����������ŵ��Re_f
omega1=cp1*(T-83)/H_vap1;
[~,mu_water_1]=viscosity(w,T_pine1,p_sat(T_m1));
Re_f1=4*omega1/(pi*0.038*mu_water_1);
omega2=cp2*(105-T)/H_vap2;
[t,mu_water_2]=viscosity(w,T_pine2,p_sat(T_m2));
Re_f2=4*omega2/(pi*0.038*mu_water_2);
%�����ڶ�������ϵ��
alpha_i1 =alpha_in(rho_1,k1,u1,mu1*10^-3,cp1);
alpha_i2 =alpha_in(rho_2,k2,u2,mu2*10^-3,cp2);
%��������������ϵ��
alpha_o1=alpha_out(Re_f1,rho_water1,rho_vapor1,mu_water_1,H_vap1,k_water1,T_sat,T_pine1);
alpha_o2=alpha_out(Re_f2,rho_water2,rho_vapor2,mu_water_2,H_vap2,k_water2,T_sat,T_pine2);
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
t_m1=(T-83)/(log(T)-log(83));   
t_m2=(105-T)/(log(105)-log(T));
%���軻�����
S1=V*rho_1*cp1*(T-83)/(K1*t_m1);
S2=V*rho_2*cp2*(105-T)/(K2*t_m2);
%�ܳ�L
%@@@@@@@@@@@@@@����S Ӧ��ָ���ǹ�������
L1=S1/(2*pi*0.032*n1)
L2=S2/(2*pi*0.032*n2)


%opt task: S_min,ƫ����׼


