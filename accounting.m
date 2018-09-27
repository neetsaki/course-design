clear
load("last_uL.mat")
u=0.8;
R=[u4];
w=0.2489;
T=120;
T_sat=120;
V=0.0267;
for i=1:1:10
    T_c=101.1500;

L4=6;
S=L4*4*0.0267/(0.032*u4);
% n1=4*V/(u1*pi*0.032^2);
n4=40;
T4=(105+T_c)/2;
rho_4=density(100*w,T4);
cp4=capacity(T4,100*w);
Q=V*rho_4*1e3*cp4*1e3*(105-T_c);
p_sat4=p_sat(T4);
k4=k(T4);
T_pine4=T_pine_new(T_c,105,u4);
T_m4=(T_sat+T_pine4)/2;
rho_water4=rho_water(T_m4);
H_vap4= H_vap(T_m4);
k_water4=k_water(T_m4);
rho_vapor4=rho_vapor(T_m4);
[mu4,~]=viscosity(w,T4+273.15,p_sat4*1e-3);
omega4=V*rho_4*1e3/n4*cp4*(105-T_c)/H_vap4;
[~,mu_water_4]=viscosity(w,T_pine4+273.15,p_sat(T_m4)*1e-3);
Re_f4=4*omega4/(pi*0.038*mu_water_4);
alpha_i4 =alpha_in(rho_4,k4,u4,mu4,cp4*1e3);
alpha_o4=alpha_out(Re_f4,rho_water4,rho_vapor4,mu_water_4,H_vap4,k_water4,T_sat,T_pine4);
k_pine=20;
Rsi=0.0002;
Rso=0.0001;
d_m=(0.038-0.032)/(log(0.038)-log(0.032));
K4=(0.038/(alpha_i4*0.032)+Rsi*0.038/0.032+0.003*0.038/(d_m*k_pine)+Rso+alpha_o4^-1)^-1;
t_m4=(105-T_c)/(log(T-T_c)-log(T-105));
u4=t_m4*K4*4*0.0267*L4/(0.032*Q);
R=[R,u4];
end
n4
plot(1:1:length(R),R)