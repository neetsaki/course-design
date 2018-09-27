%此函数用于优化设计
%拟采用遗传算法
group=zeros(100,3);
Loss=zeros(100,1);
%存活率n(%)
n=0.9;
%初始化
for i=1:1:100
    u1=0.5+rand();
    u2=0.5+rand();
    T=83+22*rand();
    group(i,:)=[u1,u2,T];
    [L1,L2]=itri(u1,u2,T);
    Loss(i)=loss_fun(L1,L2);
end
for i_it=1:1:100
%selection
num_select=floor(length(group)*n);
select=zeros(num_select,3);
for j=1:1:num_select
    m=round(length(group)*rand()+0.5);
    o=round(length(group)*rand()+0.5);
    loss_m=Loss(m);
    loss_o=Loss(o);
    if loss_m>loss_o
        select(j,:)=group(m,:);
    else
        select(j,:)=group(o,:);
    end
end

%generate
for i=1:1:num_select
    %随机种子
    m=round((num_select-1)*rand()+1);
    o=round((num_select-1)*rand()+1);
    t=rand();
    if t>2/3
        a=select(m,1);
        select(m,1)=select(o,1);
        select(o,1)=a;
    elseif (t>1/3)&&(t<2/3)
        a=select(m,2);
        select(m,2)=select(o,2);
        select(o,3)=a;
    else
        a=select(m,3);
        select(m,3)=select(o,3);
        select(o,3)=a;
    end
end

if num_select>70
    group=select;
else
    group(1:1:num_select,:)=select;
    for re=1:1:100-num_select
        m=round((num_select-1)*rand()+1);
        group(num_select+re,:)=[select(m,1)+(1.5-select(m,1))*rand(),select(m,2)+(1.5-select(m,2))*rand(),select(m,3)+(103-select(m,3))*rand()];
    end
end
an_s=length(group);
for i=1:1:an_s
    gem=group(i,:);
    [L1,L2]=itri(gem(1),gem(2),gem(3));
    Loss(i)=loss_fun(L1,L2);
end
end