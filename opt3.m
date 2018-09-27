% loss=zeros(100,100,100);
% for i=1:1:100
%     for j=1:1:100
%         for k=1:1:100
%             [L1,L2]=itri(0.5+0.01*i,0.5+0.01*j,83+0.22*k);
%             loss(i,j,k)=loss_fun(L1,L2);
%         end
%     end 
% end
% 
% 
% for i=1:1:100
%     for j=1:1:100
%         l(i,j)=max(loss(i,j,:));
%     end
% end
% for i=1:1:100
%     m(i)=max(loss(i,:));
% end
% n=max(m)


z=zeros(100,100);
for i=1:1:100
    for j=1:1:100
        u1=0.5+i/100;
        u2=0.7;
        %u2=0.5+j/100;
        %T=94;
        T=83+15/100*j;
        [L1,L2]=itri(u1,u2,T);
        z(i,j)=loss_fun(L1,L2);
    end
end
[x,y]=meshgrid(1:1:100,1:1:100);
mesh(x,y,z)