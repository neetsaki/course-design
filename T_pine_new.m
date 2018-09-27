function T_pine0= T_pine_new(T1,T2,u0)
%壁温迭代计算,T此处为两换热器中间温度
T_pine0=100;
a=0;
%T=94;
tm=(T2+T1)/2;
T_sat=120;
w=0.2498;
%u0=0.7;
%error=[];
%for i=1:1:100
while abs(T_pine0-a)>1e-4
    a=T_pine0;
    T_m0=(T_pine0+T_sat)/2;%degree
    rho_water0=rho_water(T_pine0);%kg/m3
    H_vap0=H_vap(T_m0);%kJ/kg
    k_water0=k_water(T_m0);%W/(m*degree)
    rho_0=density(w,tm);%kg/L
    mu1=viscosity(w,tm+273.15,p_sat(tm)*1e-3);%Pa*s
    cp=capacity(tm,w);%kJ/(kg*degree)
    k0=k(tm);%W/(m*degree)
    %@@@@@@@@@
    rho_vapor0=0;
    V=0.0267;
    omega0=V*rho_0*1e3*(T2-T1)/H_vap0;
    [~,mu_water_0]=viscosity(w,T_pine0+273.15,p_sat(T_m0)*1e-3);
    Re_f0=4*omega0/(pi*0.038*mu_water_0);
    alpha_i0=alpha_in(rho_0,k0,u0,mu1,cp*1e3);
    alpha_o0=alpha_out(Re_f0,rho_water0,rho_vapor0,mu_water_0,H_vap0,k_water0,T_sat,T_pine0);
    T_pine0=(T_sat*alpha_o0+tm*alpha_i0)/(alpha_o0+alpha_i0);
    %error=[error T_pine0-a];
end
end



