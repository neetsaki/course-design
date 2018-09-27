%退火
n=1e4;
group=zeros(n,3);
loss=zeros(n,1);
%初始化
for i=1:1:n
    u1=0.5+0.5*rand();
    u2=0.5+0.5*rand();
    T=83+17*rand();
    group(i,:)=[u1,u2,T];
    [L1,L2]=itri(u1,u2,T);
    loss(i)=loss_fun(L1,L2);
end



%m=round((n-1)*rand()+1);
%退火长度m
L=[];
for all=1:1:100
while var(group(1,:)-group(99,:))>1e-5
%for it=1:1:100
m=5;
rate=zeros(m,1);
group_tem=zeros(m,1);
for j=1:1:n-m+1
    for t=1:1:m
        rate(t)=loss(j+t-1)/sum(loss(j:1:j+m-1));
        group_tem(j,1)=dot(rate,group(j:1:j+m-1,1));
        group_tem(j,2)=dot(rate,group(j:1:j+m-1,2));
        group_tem(j,3)=dot(rate,group(j:1:j+m-1,3));
    end
end
l=n-length(group_tem);
group=[];
for i=1:1:l
    u1=0.5+0.5*rand();
    u2=0.5+0.5*rand();
    T=83+17*rand();
    group(i,:)=[u1,u2,T];
end
group=[group_tem;group];
for i=1:1:100
    group(i,:)=[u1,u2,T];
    [L1,L2]=itri(u1,u2,T);
    loss(i)=loss_fun(L1,L2);
end

end


L=[L max(loss)];
end
[a,b]=itri(group(1,1),group(1,2),group(1,3))
plot(1:1:length(L),L)



