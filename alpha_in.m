function alpha_i =alpha_in(rho,k,u,mu,cp)
%管内导热系数
%rho(kg/dm3),k(W/(m*degree)),u(m/s),mu(Pa*s),cp(J*(kg*degree))
%按不同经验公式计算管内导热系数
Re=0.032*u*rho*1000/mu;
Pr=cp*mu/k;
d=0.032;
if Re>2300
    if (0.7<Pr)&&(Pr<120)
        %Dittus-Boelter
        alpha_i=0.023*k/d*Re^0.8*Pr^0.4;
    else
        %Sieder-Tate-1
        alpha_i=0.027*k/d*Re^0.8*Pr^1/3*1.05;
    end
elseif Re<=2300
    %Sieder-Tate-2,@@@@@@@此处管长L暂定为6m
    L=6;
    alpha_i=1.86*k/d*(Re*Pr*d/L)^1/3*1.05^0.14;
end

end

