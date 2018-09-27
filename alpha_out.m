 function alpha_o=alpha_out(Re_f,rho_water,rho_vapor,mu_water,H_vap,k_water,T_sat,T_pine)
%两管外冷凝传热系数计算（W/(m2*degree)）,rho_water(kg/m3),k_water(W*(m*degree)),L为管长（m）,H_vap蒸发焓（kJ/kg）
if Re_f<1800
    alpha_o=1.13*(rho_water*(rho_water-rho_vapor)*9.8*H_vap*1e3*k_water^3/(mu_water*6*(T_sat-T_pine)))^0.25;
else
    %Kirkbrde
    alpha_o=0.0076*k_water*((rho_water-rho_vapor)*9.8/mu_water^2)^(1/3)*Re_f^0.4;
end
end

