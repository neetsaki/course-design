%�Ż�����
clear
format long
u1=0.7;
u2=0.9;
u3=0.9;
u4=0.9;
u5=0.7;
T1=88;
T2=91.14;
T3=96.59;
T4=101;
lr1=1e-10;
lr2=1e-7;
lr3=1e-7;
num=1000;

L=[20;10];
n=1;
%for t=1:1:10
%     T1=T1+2*rand();
%     T2=T2+2*rand();
%     T3=T3+2*rand();
while (abs(L(n+1)-L(n))>1e-4) && (n<150)
%for i=1:1:num
    grad1=loss_fun_5(u1+1e-5,u2,u3,u4,u5,T1,T2,T3,T4)/1e-5;
    grad2=loss_fun_5(u1,u2+1e-5,u3,u4,u5,T1,T2,T3,T4)/1e-5;
    grad3=loss_fun_5(u1,u2,u3+1e-5,u4,u5,T1,T2,T3,T4)/1e-5;
    grad4=loss_fun_5(u1,u2,u3,u4+1e-5,u5,T1,T2,T3,T4)/1e-5;   
    grad5=loss_fun_5(u1,u2,u3,u4,u5+1e-5,T1,T2,T3,T4)/1e-5;
    grad6=loss_fun_5(u1,u2,u3,u4,u5,T1+1e-4,T2,T3,T4)/1e-4;
    grad7=loss_fun_5(u1,u2,u3,u4,u5,T1,T2+1e-4,T3,T4)/1e-4;
    grad8=loss_fun_5(u1,u2,u3,u4,u5,T1,T2,T3+1e-4,T4)/1e-4;
    grad9=loss_fun_5(u1,u2,u3,u4,u5,T1,T2,T3,T4+1e-4)/1e-4;
    u1=u1-lr1*rand()*grad1/sqrt(n+1);
    u2=u2-lr1*rand()*grad2/sqrt(n+1);
    u3=u3-lr1*rand()*grad3/sqrt(n+1);
    u4=u4-lr1*rand()*grad4/sqrt(n+1);
    u5=u5-lr1*rand()*grad5/sqrt(n+1);
    T1=T1-lr2*rand()*grad6/sqrt(n+1);
    T2=T2-lr2*rand()*grad7/sqrt(n+1);
    T3=T3-lr3*rand()*grad8/sqrt(n+1);
    T4=T4-lr3*rand()*grad9/sqrt(n+1);
    L(n+2)=loss_fun_5(u1,u2,u3,u4,u5,T1,T2,T3,T4);
    n=n+1;
end
%end


plot(1:1:length(L),L)
a=[u1,u2,u3,u4,u5,T1,T2,T3,T4]
[L1,L2,L3,L4,L5]=itri5(u1,u2,u3,u4,u5,T1,T2,T3,T4)