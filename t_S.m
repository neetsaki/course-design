%±ÚÎÂ¹ÀËã
T_pine0=100;

T=94;
tm=(94+83)/2;
T_sat=120;
w=24.98;
u0=0.7;
error=[];
%for i=1:1:100
while abs(T_pine0-a)>1e-5
    a=T_pine0;
    T_m0=(T_pine0+T_sat)/2;
    rho_water0=rho_water(T_pine0);
    H_vap0=H_vap(T_m0);
    k_water0=k_water(T_m0);
    rho_0=density(w,tm);
    mu1=viscosity(5.025,tm,p_sat(tm));
    cp=capacity(tm,w);
    k0=k(tm);
    %@@@@@@@@@
    rho_vapor0=0;
    omega0=cp*(T-83)/H_vap0;
    [~,mu_water_0]=viscosity(w,T_pine0,p_sat(T_m0));
    Re_f0=4*omega0/(pi*0.038*mu_water_0);
    alpha_i0 =alpha_in(rho_0,k0,u0,mu1,cp);
    alpha_o0=alpha_out(Re_f0,rho_water0,rho_vapor0,mu_water_0,H_vap0,k_water0,T_sat,T_pine0);
    T_pine0=(T_sat*alpha_o0+tm*alpha_i0)/(alpha_o0+alpha_i0);
    %error=[error T_pine0-a];
end
%plot(1:1:length(error),error)
%print(T_pine0)
