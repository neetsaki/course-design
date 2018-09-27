for i=1:1:12
    [L1(i),L2(i),L3(i)]=itri3(0.6+0.06*1.3,0.5+0.06*4,0.5+0.06*2.4,89+0.5*1.7,90+6.6);
end
plot(1:1:length(L1),L1);hold on;
plot(1:1:length(L2),L2);hold on;
plot(1:1:length(L3),L3)