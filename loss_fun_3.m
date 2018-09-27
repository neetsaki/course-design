%ËðÊ§º¯Êýloss_fun
function loss=loss_fun_3(u1,u2,u3,T1,T2)
%a=1/4;
%a=1/6;
[L1,L2,L3]=itri3(u1,u2,u3,T1,T2);
a=inf;
b=1;
%loss=max(exp(-a*abs(L1-3)),exp(-b*abs(L1-6)))+max(exp(-a*abs(L2-3)),exp(-b*abs(L2-6)));
loss=(L1-6)^4+(L2-6)^4+(L3-6)^4;
end

