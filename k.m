function k_i = k(x)
%��ͬ�¶���±ˮ����ϵ�����k(W/(m*degree)),x:T(degree)
p1 =-5.862e-06;
p2 =0.00164;
p3 = 0.541;
k_i=p1*x^2 + p2*x + p3;
end

