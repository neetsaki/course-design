%ËðÊ§º¯Êýloss_fun
function loss=loss_fun_4(u1,u2,u3,u4,T1,T2,T3)
%a=1/4;
%a=1/6;
[L1,L2,L3,L4]=itri4(u1,u2,u3,u4,T1,T2,T3);
a=inf;
b=1;
%loss=max(exp(-a*abs(L1-3)),exp(-b*abs(L1-6)))+max(exp(-a*abs(L2-3)),exp(-b*abs(L2-6)));
%loss=(L1-3)^4+(L2-6)^4+(L3-3)^4+(L4-6)^4;
loss=(L1-6)^4+(L2-6)^4+(L3-6)^4+(L4-6)^4;
%loss=relu(L1-6)+relu(L2-3)+relu(L3-3)+relu(L4-6);
%loss=min((L1-3)^2,(L1-6)^2)+min((L2-3)^2,(L2-6)^2)+min((L3-3)^2,(L3-6)^2)+min((L4-3)^2+(L4-6)^2);
end
